import 'dart:collection';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:framboise/graphql/graphql_api.graphql.dart';
import 'package:framboise/models/token.dart';
import 'package:dio/dio.dart' as dio;
import 'package:framboise/models/user.dart';
import 'package:framboise/page/splash_screen.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ErrorType { expiredToken, unknown, noInternet, tokenRefreshed }

class ErrorHandling {
  Future<ErrorType> errorProcessing(BuildContext context, GraphQLResponse<dynamic> result, Function callBack) async {
    if (result.hasErrors) {
      debugPrint(result.errors.toString());
      if (result.errors?[0].message == "NO_INTERNET") {
        return ErrorType.noInternet;
      }

      if (result.errors?[0].extensions?["code"] == "EXPIRED_TOKEN") {
        bool? hasRefresh = await refreshToken(context);
        if (hasRefresh ?? false) {
          await callBack();
          return ErrorType.tokenRefreshed;
        }
        return ErrorType.expiredToken;
      }
    }
    return ErrorType.unknown;
  }

  ///Retourne [false] si l'utilisateur n'a pas pu refresh son token
  ///sinon null si l'utilisateur a été redirigé vers le [SplashScreen]
  ///Retoune [true] si l'utilisateur a refresh le token
  Future<bool?> refreshToken(BuildContext context) async {
    User? user = Hive.box<User>("user").get("current");
    if (user != null) {
      ArtemisClient _client = getGraphQlClient(user.token?.refresh);
      final response = await _client.execute(
        RefreshTokenMutation(),
      );
      if (response.hasErrors) {
        debugPrint("Error while refreshing the token");
        await Hive.box<User>("user").clear();
        await Hive.box<User>("user").clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Impossible de se connecter"),
          ),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ),
            (route) => false);
        return null;
      } else {
        Token newToken = Token(
            access: response.data!.refreshToken.token!.access, refresh: response.data!.refreshToken.token!.refresh);
        user.token = newToken;
        Hive.box<User>("user").put("current", user);
      }
      return true;
    }
    return false;
  }
}

final errorHandling = ErrorHandling();

///Get the default [ArtemisClient] for [Mutation] & [Query]
ArtemisClient getGraphQlClient(String? _token) {
  debugPrint(_token);
  final dioClient = dio.Dio()
    ..interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_token != null) {
            options.headers["Authorization"] = "Bearer " + _token;
          }
          options.headers["apollographql-client-name"] = appInfo.packageInfo.packageName;
          options.headers["apollographql-client-version"] = appInfo.packageInfo.buildNumber;

          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response == null) {
            dio.Response<dynamic> newRes = dio.Response(requestOptions: dio.RequestOptions(path: 'path'));
            Map<String, dynamic> newData = {
              'errors': [
                {'message': 'NO_INTERNET'}
              ],
              'extensions': 'extension'
            };
            HashMap<dynamic, dynamic> hNewData = HashMap();
            hNewData.putIfAbsent(0, () => newData);
            newRes.data = newData;
            newRes.statusCode = 200;
            newRes.statusMessage = 'no internet';
            handler.resolve(newRes);
          } else {
            error.response!.statusCode = 200;
            handler.resolve(error.response!);
          }
        },
        onResponse: (response, handler) {
          response.statusCode = 200;
          return handler.next(response);
        },
      ),
    );
  DioLink _dioLink = DioLink(
    "http://localhost:5000/graphql",
    client: dioClient,
  );
  return ArtemisClient.fromLink(_dioLink);
}

class AppInfo {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );
  late Locale myLocale;

  Future<void> initPackageInfo(BuildContext context) async {
    myLocale = Localizations.localeOf(context);
    final info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }
}

final appInfo = AppInfo();
