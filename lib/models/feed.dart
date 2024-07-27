import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Feed {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String url;
  final String userId;

  Feed({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.url,
    required this.userId,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
