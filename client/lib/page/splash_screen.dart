import 'dart:async';

import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:framboise/graphql/utils.dart';
import 'package:framboise/home.dart';
import 'package:framboise/models/token.dart';
import 'package:framboise/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../graphql/graphql_api.graphql.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController _nameEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => SplashScreenProvider(ctx),
      child: Consumer<SplashScreenProvider>(builder: (context, provider, _) {
        if (!provider.isInit) {
          provider.init();
        }
        return Scaffold(
          body: Column(
            children: [
              if (provider.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (!provider.isLoading) TextFormField(),
              TextFormField(
                controller: _nameEmail,
                decoration: const InputDecoration(label: Text("Nom ou email")),
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(label: Text("Password")),
              ),
              TextButton(
                onPressed: () {
                  provider.connexion(_nameEmail.text, _password.text);
                },
                child: const Text(
                  "Connexion",
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class SplashScreenProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isInit = false;
  late BuildContext context;
  SplashScreenProvider(BuildContext ctx) {
    context = ctx;
  }

  /// Si un user existe, initialise l'app avec [getUserInfo] afin de recupéré
  /// les données du user.
  ///
  ///  Si non affiche l'écran de connexion / inscription
  void init() async {
    await Hive.openBox<User>("user");
    User? user = Hive.box<User>(
      "user",
    ).get("current");
    if (user != null) {
      //Fetch user info
      if (!await getUserInfo(user.token)) {
        Timer(const Duration(milliseconds: 100), () {
          isLoading = false;
          isInit = true;
          notifyListeners();
        });
      } else {
        //The user is redirected
        return;
      }
    } else {
      Timer(const Duration(milliseconds: 100), () {
        isLoading = false;
        isInit = true;
        notifyListeners();
      });
    }
  }

  /// Effecture une [MeQuery] afin de récupéré toutes les données et
  /// les sauvegardes dans l'objet [User]
  Future<bool> getUserInfo(Token? token) async {
    ArtemisClient _client = getGraphQlClient(token?.access);
    final _response = await _client.execute(
      MeQuery(),
    );
    if (_response.hasErrors) {
      ErrorType _error = await errorHandling.errorProcessing(context, _response, () {
        getUserInfo(token);
      });
      if (_error == ErrorType.tokenRefreshed) {
        //Token refreshed nothing to do
        return true;
      } else if (_error == ErrorType.expiredToken) {
        //Token expired need to relog
        return false;
      } else {
        //User exist & is log but another error appear => user can be log
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false,
        );
      }
    }
    if (_response.data != null && _response.data?.me.user != null) {
      User user = User(
          token: token,
          email: _response.data!.me.user!.email,
          admin: _response.data!.me.user!.admin ?? false,
          count: _response.data!.me.user!.count ?? 0,
          name: _response.data!.me.user!.name);

      Hive.box<User>("user").put("current", user);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
        (route) => false,
      );
    } else {
      return false;
    }
    return true;
  }

  void connexion(String nameOrEmail, String password) async {
    isLoading = true;
    notifyListeners();
    ArtemisClient _client = getGraphQlClient(null);
    final res = await _client
        .execute(ConnectMutation(variables: ConnectArguments(emailOrUsername: nameOrEmail, password: password)));
    if (res.hasErrors || res.data?.connect.token?.access == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.errors?.first.message ?? "Impossible de se connecter",
          ),
        ),
      );
      isLoading = false;
      notifyListeners();
      return;
    }
    Token token = Token(
      access: res.data!.connect.token!.access,
      refresh: res.data!.connect.token!.refresh,
    );
    if (await getUserInfo(token)) {
      return;
    }
    isLoading = false;
    notifyListeners();
  }
}
