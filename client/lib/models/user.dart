import 'package:framboise/models/token.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  Token? token;
  @HiveField(1)
  String email;
  @HiveField(2)
  String name;
  @HiveField(3)
  int count;
  @HiveField(4)
  bool admin;
  User({
    required this.token,
    required this.email,
    required this.admin,
    required this.count,
    required this.name,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
