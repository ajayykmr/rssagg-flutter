import 'dart:convert';

import 'package:rssagg_flutter/models/models.dart';
import 'package:convert/convert.dart';

import '../data_provider/feeds_data_provider.dart';


class FeedsRepository {
  final FeedsDataProvider feedsDataProvider;

  FeedsRepository(this.feedsDataProvider);

  Future<List<Feed>> fetchAllFeeds() async {
    try{
      final feeds = await feedsDataProvider.fetchAllFeeds();
      final feedsJson = jsonDecode(feeds) as Map<String, dynamic>;

      final List<Feed> list =
          feedsJson['feeds'].map<Feed>((feed) => Feed.fromJson(feed)).toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Feed>> fetchUserCreatedFeeds() async {
    try {
      final feeds = await feedsDataProvider.fetchAllFeeds();
      final feedsJson = jsonDecode(feeds) as Map<String, dynamic>;

      final List<Feed> list =
          feedsJson['feeds'].map<Feed>((feed) => Feed.fromJson(feed)).toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createFeed(String feedName, String feedUrl) async {
    try {
      final res = await feedsDataProvider.createFeed(feedName, feedUrl,);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}