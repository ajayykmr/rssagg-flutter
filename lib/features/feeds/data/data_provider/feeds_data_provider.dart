import 'dart:convert';

import 'package:rssagg_flutter/common/utils/utils.dart';
import 'package:rssagg_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class FeedsDataProvider {
  static const String BASE_URL = Constants.BASE_URL;
  final String authToken;
  FeedsDataProvider(this.authToken);

  Future<String> fetchAllFeeds() async {
    //add authorization headers
    try{
      final res = await http.get(
        Uri.parse('$BASE_URL/feeds'),
      );

      if (res.statusCode != 200) {
        throw Exception(res.body);
      }

      return  res.body;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> fetchUserCreatedFeeds() async {
    try {
      final res = await http.get(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/feeds/user'),
      );

      if (res.statusCode != 200) {
        throw Exception(res.body);
      }

      return res.body;
    } catch(e) {
      rethrow;
    }
  }

  Future<String> createFeed(String feedName, String feedUrl,) async {
    try {
      final res = await http.post(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/feeds'),
        body: jsonEncode({
          'name': feedName,
          'url': feedUrl,
        }),
      );

      if (res.statusCode != 201) {
        throw Exception(res.body);
      }

      return res.body;
    } catch(e) {
      rethrow;
    }
  }

  Future<void> followFeed(String feedID) async {
    try {
      final res = await http.post(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/feed-follows'),
        body: jsonEncode({
          'feed_id': feedID,
        }),
      );

      if (res.statusCode != 201) {
        throw Exception(res.body);
      }
    } catch(e) {
      rethrow;
    }
  }

  Future<void> unFollowFeed(String feedFollowId) async {
    try {
      final res = await http.delete(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/feed-follows/$feedFollowId'),
      );

      if (res.statusCode != 200) {
        throw Exception(res.body);
      }
    } catch(e) {
      rethrow;
    }
  }

  Future<List<FeedFollow>> getUserFeedFollows() async {
    try {
      final res = await http.get(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/feed-follows'),
      );

      if (res.statusCode != 200) {
        throw Exception(res.body);
      }

      final feeds = res.body;
      final feedsJson = jsonDecode(feeds) as Map<String, dynamic>;

      final List<FeedFollow> list =
      feedsJson['feed_follows'].map<FeedFollow>((feedFollow) => FeedFollow.fromJson(feedFollow)).toList();



      return list;
    } catch(e) {
      rethrow;
    }
  }
}
