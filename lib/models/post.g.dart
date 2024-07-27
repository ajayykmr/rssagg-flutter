// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      publishedAt: DateTime.parse(json['published_at'] as String),
      url: json['url'] as String,
      feedId: json['feed_id'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'published_at': instance.publishedAt.toIso8601String(),
      'url': instance.url,
      'feed_id': instance.feedId,
    };
