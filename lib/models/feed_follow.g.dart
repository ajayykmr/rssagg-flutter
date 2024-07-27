// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedFollow _$FeedFollowFromJson(Map<String, dynamic> json) => FeedFollow(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      feedId: json['feed_id'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$FeedFollowToJson(FeedFollow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'feed_id': instance.feedId,
      'user_id': instance.userId,
    };
