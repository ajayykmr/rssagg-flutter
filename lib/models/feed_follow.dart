import 'package:json_annotation/json_annotation.dart';

part 'feed_follow.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class FeedFollow {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String feedId;
  final String userId;

  FeedFollow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.feedId,
    required this.userId,
  });

  factory FeedFollow.fromJson(Map<String, dynamic> json) => _$FeedFollowFromJson(json);
  Map<String, dynamic> toJson() => _$FeedFollowToJson(this);
}
