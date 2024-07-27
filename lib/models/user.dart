import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String apiKey;
  final String email;
  final String token;

  const User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.apiKey,
    required this.email,
    required this.token,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



