import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final String role;

  User({
    this.id = -1,
    this.name = "",
    this.email = "",
    this.role = "",
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
