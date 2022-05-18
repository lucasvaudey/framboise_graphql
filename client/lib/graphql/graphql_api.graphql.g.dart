// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register$Mutation$Register$Token _$Register$Mutation$Register$TokenFromJson(
        Map<String, dynamic> json) =>
    Register$Mutation$Register$Token()
      ..access = json['access'] as String
      ..refresh = json['refresh'] as String;

Map<String, dynamic> _$Register$Mutation$Register$TokenToJson(
        Register$Mutation$Register$Token instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

Register$Mutation$Register$Error _$Register$Mutation$Register$ErrorFromJson(
        Map<String, dynamic> json) =>
    Register$Mutation$Register$Error()
      ..message = json['message'] as String
      ..label = json['label'] as String;

Map<String, dynamic> _$Register$Mutation$Register$ErrorToJson(
        Register$Mutation$Register$Error instance) =>
    <String, dynamic>{
      'message': instance.message,
      'label': instance.label,
    };

Register$Mutation$Register _$Register$Mutation$RegisterFromJson(
        Map<String, dynamic> json) =>
    Register$Mutation$Register()
      ..token = json['token'] == null
          ? null
          : Register$Mutation$Register$Token.fromJson(
              json['token'] as Map<String, dynamic>)
      ..error = json['error'] == null
          ? null
          : Register$Mutation$Register$Error.fromJson(
              json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$Register$Mutation$RegisterToJson(
    Register$Mutation$Register instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token?.toJson());
  writeNotNull('error', instance.error?.toJson());
  return val;
}

Register$Mutation _$Register$MutationFromJson(Map<String, dynamic> json) =>
    Register$Mutation()
      ..register = Register$Mutation$Register.fromJson(
          json['register'] as Map<String, dynamic>);

Map<String, dynamic> _$Register$MutationToJson(Register$Mutation instance) =>
    <String, dynamic>{
      'register': instance.register.toJson(),
    };

OpenTheGate$Mutation _$OpenTheGate$MutationFromJson(
        Map<String, dynamic> json) =>
    OpenTheGate$Mutation()..openTheGate = json['openTheGate'] as bool;

Map<String, dynamic> _$OpenTheGate$MutationToJson(
        OpenTheGate$Mutation instance) =>
    <String, dynamic>{
      'openTheGate': instance.openTheGate,
    };

Connect$Mutation$Connect$Error _$Connect$Mutation$Connect$ErrorFromJson(
        Map<String, dynamic> json) =>
    Connect$Mutation$Connect$Error()
      ..label = json['label'] as String
      ..message = json['message'] as String;

Map<String, dynamic> _$Connect$Mutation$Connect$ErrorToJson(
        Connect$Mutation$Connect$Error instance) =>
    <String, dynamic>{
      'label': instance.label,
      'message': instance.message,
    };

Connect$Mutation$Connect$Token _$Connect$Mutation$Connect$TokenFromJson(
        Map<String, dynamic> json) =>
    Connect$Mutation$Connect$Token()
      ..access = json['access'] as String
      ..refresh = json['refresh'] as String;

Map<String, dynamic> _$Connect$Mutation$Connect$TokenToJson(
        Connect$Mutation$Connect$Token instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

Connect$Mutation$Connect _$Connect$Mutation$ConnectFromJson(
        Map<String, dynamic> json) =>
    Connect$Mutation$Connect()
      ..error = json['error'] == null
          ? null
          : Connect$Mutation$Connect$Error.fromJson(
              json['error'] as Map<String, dynamic>)
      ..token = json['token'] == null
          ? null
          : Connect$Mutation$Connect$Token.fromJson(
              json['token'] as Map<String, dynamic>);

Map<String, dynamic> _$Connect$Mutation$ConnectToJson(
    Connect$Mutation$Connect instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error?.toJson());
  writeNotNull('token', instance.token?.toJson());
  return val;
}

Connect$Mutation _$Connect$MutationFromJson(Map<String, dynamic> json) =>
    Connect$Mutation()
      ..connect = Connect$Mutation$Connect.fromJson(
          json['connect'] as Map<String, dynamic>);

Map<String, dynamic> _$Connect$MutationToJson(Connect$Mutation instance) =>
    <String, dynamic>{
      'connect': instance.connect.toJson(),
    };

ChangePassword$Mutation$ChangePassword$Token
    _$ChangePassword$Mutation$ChangePassword$TokenFromJson(
            Map<String, dynamic> json) =>
        ChangePassword$Mutation$ChangePassword$Token()
          ..access = json['access'] as String
          ..refresh = json['refresh'] as String;

Map<String, dynamic> _$ChangePassword$Mutation$ChangePassword$TokenToJson(
        ChangePassword$Mutation$ChangePassword$Token instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

ChangePassword$Mutation$ChangePassword$Error
    _$ChangePassword$Mutation$ChangePassword$ErrorFromJson(
            Map<String, dynamic> json) =>
        ChangePassword$Mutation$ChangePassword$Error()
          ..label = json['label'] as String
          ..message = json['message'] as String;

Map<String, dynamic> _$ChangePassword$Mutation$ChangePassword$ErrorToJson(
        ChangePassword$Mutation$ChangePassword$Error instance) =>
    <String, dynamic>{
      'label': instance.label,
      'message': instance.message,
    };

ChangePassword$Mutation$ChangePassword
    _$ChangePassword$Mutation$ChangePasswordFromJson(
            Map<String, dynamic> json) =>
        ChangePassword$Mutation$ChangePassword()
          ..token = json['token'] == null
              ? null
              : ChangePassword$Mutation$ChangePassword$Token.fromJson(
                  json['token'] as Map<String, dynamic>)
          ..error = json['error'] == null
              ? null
              : ChangePassword$Mutation$ChangePassword$Error.fromJson(
                  json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$ChangePassword$Mutation$ChangePasswordToJson(
    ChangePassword$Mutation$ChangePassword instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token?.toJson());
  writeNotNull('error', instance.error?.toJson());
  return val;
}

ChangePassword$Mutation _$ChangePassword$MutationFromJson(
        Map<String, dynamic> json) =>
    ChangePassword$Mutation()
      ..changePassword = ChangePassword$Mutation$ChangePassword.fromJson(
          json['changePassword'] as Map<String, dynamic>);

Map<String, dynamic> _$ChangePassword$MutationToJson(
        ChangePassword$Mutation instance) =>
    <String, dynamic>{
      'changePassword': instance.changePassword.toJson(),
    };

DeleteUser$Mutation _$DeleteUser$MutationFromJson(Map<String, dynamic> json) =>
    DeleteUser$Mutation()..deleteUser = json['deleteUser'] as bool;

Map<String, dynamic> _$DeleteUser$MutationToJson(
        DeleteUser$Mutation instance) =>
    <String, dynamic>{
      'deleteUser': instance.deleteUser,
    };

RefreshToken$Mutation$RefreshToken$Error
    _$RefreshToken$Mutation$RefreshToken$ErrorFromJson(
            Map<String, dynamic> json) =>
        RefreshToken$Mutation$RefreshToken$Error()
          ..label = json['label'] as String
          ..message = json['message'] as String;

Map<String, dynamic> _$RefreshToken$Mutation$RefreshToken$ErrorToJson(
        RefreshToken$Mutation$RefreshToken$Error instance) =>
    <String, dynamic>{
      'label': instance.label,
      'message': instance.message,
    };

RefreshToken$Mutation$RefreshToken$Token
    _$RefreshToken$Mutation$RefreshToken$TokenFromJson(
            Map<String, dynamic> json) =>
        RefreshToken$Mutation$RefreshToken$Token()
          ..access = json['access'] as String
          ..refresh = json['refresh'] as String;

Map<String, dynamic> _$RefreshToken$Mutation$RefreshToken$TokenToJson(
        RefreshToken$Mutation$RefreshToken$Token instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

RefreshToken$Mutation$RefreshToken _$RefreshToken$Mutation$RefreshTokenFromJson(
        Map<String, dynamic> json) =>
    RefreshToken$Mutation$RefreshToken()
      ..error = json['error'] == null
          ? null
          : RefreshToken$Mutation$RefreshToken$Error.fromJson(
              json['error'] as Map<String, dynamic>)
      ..token = json['token'] == null
          ? null
          : RefreshToken$Mutation$RefreshToken$Token.fromJson(
              json['token'] as Map<String, dynamic>);

Map<String, dynamic> _$RefreshToken$Mutation$RefreshTokenToJson(
    RefreshToken$Mutation$RefreshToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error?.toJson());
  writeNotNull('token', instance.token?.toJson());
  return val;
}

RefreshToken$Mutation _$RefreshToken$MutationFromJson(
        Map<String, dynamic> json) =>
    RefreshToken$Mutation()
      ..refreshToken = RefreshToken$Mutation$RefreshToken.fromJson(
          json['refreshToken'] as Map<String, dynamic>);

Map<String, dynamic> _$RefreshToken$MutationToJson(
        RefreshToken$Mutation instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken.toJson(),
    };

Me$Query$Me$User _$Me$Query$Me$UserFromJson(Map<String, dynamic> json) =>
    Me$Query$Me$User()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..email = json['email'] as String
      ..count = json['count'] as int?
      ..admin = json['admin'] as bool?;

Map<String, dynamic> _$Me$Query$Me$UserToJson(Me$Query$Me$User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('admin', instance.admin);
  return val;
}

Me$Query$Me _$Me$Query$MeFromJson(Map<String, dynamic> json) => Me$Query$Me()
  ..user = json['user'] == null
      ? null
      : Me$Query$Me$User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$Me$Query$MeToJson(Me$Query$Me instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

Me$Query _$Me$QueryFromJson(Map<String, dynamic> json) =>
    Me$Query()..me = Me$Query$Me.fromJson(json['me'] as Map<String, dynamic>);

Map<String, dynamic> _$Me$QueryToJson(Me$Query instance) => <String, dynamic>{
      'me': instance.me.toJson(),
    };

ListUser$Query$ListUser _$ListUser$Query$ListUserFromJson(
        Map<String, dynamic> json) =>
    ListUser$Query$ListUser()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..email = json['email'] as String
      ..count = json['count'] as int?
      ..admin = json['admin'] as bool?;

Map<String, dynamic> _$ListUser$Query$ListUserToJson(
    ListUser$Query$ListUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('admin', instance.admin);
  return val;
}

ListUser$Query _$ListUser$QueryFromJson(Map<String, dynamic> json) =>
    ListUser$Query()
      ..listUser = (json['listUser'] as List<dynamic>?)
          ?.map((e) =>
              ListUser$Query$ListUser.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListUser$QueryToJson(ListUser$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listUser', instance.listUser?.map((e) => e.toJson()).toList());
  return val;
}

RegisterArguments _$RegisterArgumentsFromJson(Map<String, dynamic> json) =>
    RegisterArguments(
      name: json['name'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$RegisterArgumentsToJson(RegisterArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
    };

ConnectArguments _$ConnectArgumentsFromJson(Map<String, dynamic> json) =>
    ConnectArguments(
      password: json['password'] as String,
      emailOrUsername: json['emailOrUsername'] as String,
    );

Map<String, dynamic> _$ConnectArgumentsToJson(ConnectArguments instance) =>
    <String, dynamic>{
      'password': instance.password,
      'emailOrUsername': instance.emailOrUsername,
    };

ChangePasswordArguments _$ChangePasswordArgumentsFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordArguments(
      newPassword: json['newPassword'] as String,
      oldPassword: json['oldPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordArgumentsToJson(
        ChangePasswordArguments instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'oldPassword': instance.oldPassword,
    };

DeleteUserArguments _$DeleteUserArgumentsFromJson(Map<String, dynamic> json) =>
    DeleteUserArguments(
      email: json['email'] as String,
    );

Map<String, dynamic> _$DeleteUserArgumentsToJson(
        DeleteUserArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
