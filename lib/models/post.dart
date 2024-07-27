
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Post {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String? description;
  final DateTime publishedAt;
  final String url;
  final String feedId;

  Post({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    this.description,
    required this.publishedAt,
    required this.url,
    required this.feedId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

