// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Register$Mutation$Register$Token extends JsonSerializable
    with EquatableMixin {
  Register$Mutation$Register$Token();

  factory Register$Mutation$Register$Token.fromJson(
          Map<String, dynamic> json) =>
      _$Register$Mutation$Register$TokenFromJson(json);

  late String access;

  late String refresh;

  @override
  List<Object?> get props => [access, refresh];
  @override
  Map<String, dynamic> toJson() =>
      _$Register$Mutation$Register$TokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation$Register$Error extends JsonSerializable
    with EquatableMixin {
  Register$Mutation$Register$Error();

  factory Register$Mutation$Register$Error.fromJson(
          Map<String, dynamic> json) =>
      _$Register$Mutation$Register$ErrorFromJson(json);

  late String message;

  late String label;

  @override
  List<Object?> get props => [message, label];
  @override
  Map<String, dynamic> toJson() =>
      _$Register$Mutation$Register$ErrorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation$Register extends JsonSerializable with EquatableMixin {
  Register$Mutation$Register();

  factory Register$Mutation$Register.fromJson(Map<String, dynamic> json) =>
      _$Register$Mutation$RegisterFromJson(json);

  Register$Mutation$Register$Token? token;

  Register$Mutation$Register$Error? error;

  @override
  List<Object?> get props => [token, error];
  @override
  Map<String, dynamic> toJson() => _$Register$Mutation$RegisterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation extends JsonSerializable with EquatableMixin {
  Register$Mutation();

  factory Register$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Register$MutationFromJson(json);

  late Register$Mutation$Register register;

  @override
  List<Object?> get props => [register];
  @override
  Map<String, dynamic> toJson() => _$Register$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenTheGate$Mutation extends JsonSerializable with EquatableMixin {
  OpenTheGate$Mutation();

  factory OpenTheGate$Mutation.fromJson(Map<String, dynamic> json) =>
      _$OpenTheGate$MutationFromJson(json);

  late bool openTheGate;

  @override
  List<Object?> get props => [openTheGate];
  @override
  Map<String, dynamic> toJson() => _$OpenTheGate$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Connect$Mutation$Connect$Error extends JsonSerializable
    with EquatableMixin {
  Connect$Mutation$Connect$Error();

  factory Connect$Mutation$Connect$Error.fromJson(Map<String, dynamic> json) =>
      _$Connect$Mutation$Connect$ErrorFromJson(json);

  late String label;

  late String message;

  @override
  List<Object?> get props => [label, message];
  @override
  Map<String, dynamic> toJson() => _$Connect$Mutation$Connect$ErrorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Connect$Mutation$Connect$Token extends JsonSerializable
    with EquatableMixin {
  Connect$Mutation$Connect$Token();

  factory Connect$Mutation$Connect$Token.fromJson(Map<String, dynamic> json) =>
      _$Connect$Mutation$Connect$TokenFromJson(json);

  late String access;

  late String refresh;

  @override
  List<Object?> get props => [access, refresh];
  @override
  Map<String, dynamic> toJson() => _$Connect$Mutation$Connect$TokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Connect$Mutation$Connect extends JsonSerializable with EquatableMixin {
  Connect$Mutation$Connect();

  factory Connect$Mutation$Connect.fromJson(Map<String, dynamic> json) =>
      _$Connect$Mutation$ConnectFromJson(json);

  Connect$Mutation$Connect$Error? error;

  Connect$Mutation$Connect$Token? token;

  @override
  List<Object?> get props => [error, token];
  @override
  Map<String, dynamic> toJson() => _$Connect$Mutation$ConnectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Connect$Mutation extends JsonSerializable with EquatableMixin {
  Connect$Mutation();

  factory Connect$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Connect$MutationFromJson(json);

  late Connect$Mutation$Connect connect;

  @override
  List<Object?> get props => [connect];
  @override
  Map<String, dynamic> toJson() => _$Connect$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation$ChangePassword$Token extends JsonSerializable
    with EquatableMixin {
  ChangePassword$Mutation$ChangePassword$Token();

  factory ChangePassword$Mutation$ChangePassword$Token.fromJson(
          Map<String, dynamic> json) =>
      _$ChangePassword$Mutation$ChangePassword$TokenFromJson(json);

  late String access;

  late String refresh;

  @override
  List<Object?> get props => [access, refresh];
  @override
  Map<String, dynamic> toJson() =>
      _$ChangePassword$Mutation$ChangePassword$TokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation$ChangePassword$Error extends JsonSerializable
    with EquatableMixin {
  ChangePassword$Mutation$ChangePassword$Error();

  factory ChangePassword$Mutation$ChangePassword$Error.fromJson(
          Map<String, dynamic> json) =>
      _$ChangePassword$Mutation$ChangePassword$ErrorFromJson(json);

  late String label;

  late String message;

  @override
  List<Object?> get props => [label, message];
  @override
  Map<String, dynamic> toJson() =>
      _$ChangePassword$Mutation$ChangePassword$ErrorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation$ChangePassword extends JsonSerializable
    with EquatableMixin {
  ChangePassword$Mutation$ChangePassword();

  factory ChangePassword$Mutation$ChangePassword.fromJson(
          Map<String, dynamic> json) =>
      _$ChangePassword$Mutation$ChangePasswordFromJson(json);

  ChangePassword$Mutation$ChangePassword$Token? token;

  ChangePassword$Mutation$ChangePassword$Error? error;

  @override
  List<Object?> get props => [token, error];
  @override
  Map<String, dynamic> toJson() =>
      _$ChangePassword$Mutation$ChangePasswordToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation extends JsonSerializable with EquatableMixin {
  ChangePassword$Mutation();

  factory ChangePassword$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ChangePassword$MutationFromJson(json);

  late ChangePassword$Mutation$ChangePassword changePassword;

  @override
  List<Object?> get props => [changePassword];
  @override
  Map<String, dynamic> toJson() => _$ChangePassword$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation();

  factory DeleteUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$MutationFromJson(json);

  late bool deleteUser;

  @override
  List<Object?> get props => [deleteUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshToken$Mutation$RefreshToken$Error extends JsonSerializable
    with EquatableMixin {
  RefreshToken$Mutation$RefreshToken$Error();

  factory RefreshToken$Mutation$RefreshToken$Error.fromJson(
          Map<String, dynamic> json) =>
      _$RefreshToken$Mutation$RefreshToken$ErrorFromJson(json);

  late String label;

  late String message;

  @override
  List<Object?> get props => [label, message];
  @override
  Map<String, dynamic> toJson() =>
      _$RefreshToken$Mutation$RefreshToken$ErrorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshToken$Mutation$RefreshToken$Token extends JsonSerializable
    with EquatableMixin {
  RefreshToken$Mutation$RefreshToken$Token();

  factory RefreshToken$Mutation$RefreshToken$Token.fromJson(
          Map<String, dynamic> json) =>
      _$RefreshToken$Mutation$RefreshToken$TokenFromJson(json);

  late String access;

  late String refresh;

  @override
  List<Object?> get props => [access, refresh];
  @override
  Map<String, dynamic> toJson() =>
      _$RefreshToken$Mutation$RefreshToken$TokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshToken$Mutation$RefreshToken extends JsonSerializable
    with EquatableMixin {
  RefreshToken$Mutation$RefreshToken();

  factory RefreshToken$Mutation$RefreshToken.fromJson(
          Map<String, dynamic> json) =>
      _$RefreshToken$Mutation$RefreshTokenFromJson(json);

  RefreshToken$Mutation$RefreshToken$Error? error;

  RefreshToken$Mutation$RefreshToken$Token? token;

  @override
  List<Object?> get props => [error, token];
  @override
  Map<String, dynamic> toJson() =>
      _$RefreshToken$Mutation$RefreshTokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshToken$Mutation extends JsonSerializable with EquatableMixin {
  RefreshToken$Mutation();

  factory RefreshToken$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RefreshToken$MutationFromJson(json);

  late RefreshToken$Mutation$RefreshToken refreshToken;

  @override
  List<Object?> get props => [refreshToken];
  @override
  Map<String, dynamic> toJson() => _$RefreshToken$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$User extends JsonSerializable with EquatableMixin {
  Me$Query$Me$User();

  factory Me$Query$Me$User.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$Me$UserFromJson(json);

  late String id;

  late String name;

  late String email;

  int? count;

  bool? admin;

  @override
  List<Object?> get props => [id, name, email, count, admin];
  @override
  Map<String, dynamic> toJson() => _$Me$Query$Me$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me extends JsonSerializable with EquatableMixin {
  Me$Query$Me();

  factory Me$Query$Me.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$MeFromJson(json);

  Me$Query$Me$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$Me$Query$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query extends JsonSerializable with EquatableMixin {
  Me$Query();

  factory Me$Query.fromJson(Map<String, dynamic> json) =>
      _$Me$QueryFromJson(json);

  late Me$Query$Me me;

  @override
  List<Object?> get props => [me];
  @override
  Map<String, dynamic> toJson() => _$Me$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListUser$Query$ListUser extends JsonSerializable with EquatableMixin {
  ListUser$Query$ListUser();

  factory ListUser$Query$ListUser.fromJson(Map<String, dynamic> json) =>
      _$ListUser$Query$ListUserFromJson(json);

  late String id;

  late String name;

  late String email;

  int? count;

  bool? admin;

  @override
  List<Object?> get props => [id, name, email, count, admin];
  @override
  Map<String, dynamic> toJson() => _$ListUser$Query$ListUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListUser$Query extends JsonSerializable with EquatableMixin {
  ListUser$Query();

  factory ListUser$Query.fromJson(Map<String, dynamic> json) =>
      _$ListUser$QueryFromJson(json);

  List<ListUser$Query$ListUser>? listUser;

  @override
  List<Object?> get props => [listUser];
  @override
  Map<String, dynamic> toJson() => _$ListUser$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterArguments extends JsonSerializable with EquatableMixin {
  RegisterArguments(
      {required this.name, required this.password, required this.email});

  @override
  factory RegisterArguments.fromJson(Map<String, dynamic> json) =>
      _$RegisterArgumentsFromJson(json);

  late String name;

  late String password;

  late String email;

  @override
  List<Object?> get props => [name, password, email];
  @override
  Map<String, dynamic> toJson() => _$RegisterArgumentsToJson(this);
}

final REGISTER_MUTATION_DOCUMENT_OPERATION_NAME = 'Register';
final REGISTER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Register'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'password')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'register'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'name'))),
              ArgumentNode(
                  name: NameNode(value: 'password'),
                  value: VariableNode(name: NameNode(value: 'password'))),
              ArgumentNode(
                  name: NameNode(value: 'email'),
                  value: VariableNode(name: NameNode(value: 'email')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'access'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'refresh'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'message'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class RegisterMutation
    extends GraphQLQuery<Register$Mutation, RegisterArguments> {
  RegisterMutation({required this.variables});

  @override
  final DocumentNode document = REGISTER_MUTATION_DOCUMENT;

  @override
  final String operationName = REGISTER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final RegisterArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Register$Mutation parse(Map<String, dynamic> json) =>
      Register$Mutation.fromJson(json);
}

final OPEN_THE_GATE_MUTATION_DOCUMENT_OPERATION_NAME = 'openTheGate';
final OPEN_THE_GATE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'openTheGate'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'openTheGate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class OpenTheGateMutation
    extends GraphQLQuery<OpenTheGate$Mutation, JsonSerializable> {
  OpenTheGateMutation();

  @override
  final DocumentNode document = OPEN_THE_GATE_MUTATION_DOCUMENT;

  @override
  final String operationName = OPEN_THE_GATE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OpenTheGate$Mutation parse(Map<String, dynamic> json) =>
      OpenTheGate$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ConnectArguments extends JsonSerializable with EquatableMixin {
  ConnectArguments({required this.password, required this.emailOrUsername});

  @override
  factory ConnectArguments.fromJson(Map<String, dynamic> json) =>
      _$ConnectArgumentsFromJson(json);

  late String password;

  late String emailOrUsername;

  @override
  List<Object?> get props => [password, emailOrUsername];
  @override
  Map<String, dynamic> toJson() => _$ConnectArgumentsToJson(this);
}

final CONNECT_MUTATION_DOCUMENT_OPERATION_NAME = 'Connect';
final CONNECT_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Connect'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'password')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'emailOrUsername')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'connect'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'password'),
                  value: VariableNode(name: NameNode(value: 'password'))),
              ArgumentNode(
                  name: NameNode(value: 'emailOrUsername'),
                  value: VariableNode(name: NameNode(value: 'emailOrUsername')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'message'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'access'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'refresh'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class ConnectMutation extends GraphQLQuery<Connect$Mutation, ConnectArguments> {
  ConnectMutation({required this.variables});

  @override
  final DocumentNode document = CONNECT_MUTATION_DOCUMENT;

  @override
  final String operationName = CONNECT_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ConnectArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Connect$Mutation parse(Map<String, dynamic> json) =>
      Connect$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ChangePasswordArguments extends JsonSerializable with EquatableMixin {
  ChangePasswordArguments(
      {required this.newPassword, required this.oldPassword});

  @override
  factory ChangePasswordArguments.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordArgumentsFromJson(json);

  late String newPassword;

  late String oldPassword;

  @override
  List<Object?> get props => [newPassword, oldPassword];
  @override
  Map<String, dynamic> toJson() => _$ChangePasswordArgumentsToJson(this);
}

final CHANGE_PASSWORD_MUTATION_DOCUMENT_OPERATION_NAME = 'ChangePassword';
final CHANGE_PASSWORD_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ChangePassword'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'newPassword')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'oldPassword')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'changePassword'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'newPassword'),
                  value: VariableNode(name: NameNode(value: 'newPassword'))),
              ArgumentNode(
                  name: NameNode(value: 'oldPassword'),
                  value: VariableNode(name: NameNode(value: 'oldPassword')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'access'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'refresh'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'message'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class ChangePasswordMutation
    extends GraphQLQuery<ChangePassword$Mutation, ChangePasswordArguments> {
  ChangePasswordMutation({required this.variables});

  @override
  final DocumentNode document = CHANGE_PASSWORD_MUTATION_DOCUMENT;

  @override
  final String operationName = CHANGE_PASSWORD_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ChangePasswordArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ChangePassword$Mutation parse(Map<String, dynamic> json) =>
      ChangePassword$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteUserArguments extends JsonSerializable with EquatableMixin {
  DeleteUserArguments({required this.email});

  @override
  factory DeleteUserArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserArgumentsFromJson(json);

  late String email;

  @override
  List<Object?> get props => [email];
  @override
  Map<String, dynamic> toJson() => _$DeleteUserArgumentsToJson(this);
}

final DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'DeleteUser';
final DELETE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'deleteUser'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'email'),
                  value: VariableNode(name: NameNode(value: 'email')))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class DeleteUserMutation
    extends GraphQLQuery<DeleteUser$Mutation, DeleteUserArguments> {
  DeleteUserMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteUser$Mutation parse(Map<String, dynamic> json) =>
      DeleteUser$Mutation.fromJson(json);
}

final REFRESH_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME = 'RefreshToken';
final REFRESH_TOKEN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RefreshToken'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'message'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'access'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'refresh'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class RefreshTokenMutation
    extends GraphQLQuery<RefreshToken$Mutation, JsonSerializable> {
  RefreshTokenMutation();

  @override
  final DocumentNode document = REFRESH_TOKEN_MUTATION_DOCUMENT;

  @override
  final String operationName = REFRESH_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  RefreshToken$Mutation parse(Map<String, dynamic> json) =>
      RefreshToken$Mutation.fromJson(json);
}

final ME_QUERY_DOCUMENT_OPERATION_NAME = 'Me';
final ME_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Me'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'me'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'count'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'admin'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class MeQuery extends GraphQLQuery<Me$Query, JsonSerializable> {
  MeQuery();

  @override
  final DocumentNode document = ME_QUERY_DOCUMENT;

  @override
  final String operationName = ME_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Me$Query parse(Map<String, dynamic> json) => Me$Query.fromJson(json);
}

final LIST_USER_QUERY_DOCUMENT_OPERATION_NAME = 'ListUser';
final LIST_USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListUser'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'listUser'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'count'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'admin'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class ListUserQuery extends GraphQLQuery<ListUser$Query, JsonSerializable> {
  ListUserQuery();

  @override
  final DocumentNode document = LIST_USER_QUERY_DOCUMENT;

  @override
  final String operationName = LIST_USER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  ListUser$Query parse(Map<String, dynamic> json) =>
      ListUser$Query.fromJson(json);
}
