import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Token {
  @HiveField(1)
  String access;
  @HiveField(2)
  String refresh;

  Token({required this.access, required this.refresh});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
