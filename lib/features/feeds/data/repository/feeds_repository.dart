import 'dart:convert';
import 'package:rssagg_flutter/models/models.dart';
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



  Future<List<FeedFollow>> getUserFeedFollows() async {
    try {
      final feedFollowsList = await feedsDataProvider.getUserFeedFollows();

      return feedFollowsList;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> followFeed(String feedId) async {
    try {
      await feedsDataProvider.followFeed(feedId);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> unfollowFeed(String feedId) async {
    try {
      await feedsDataProvider.unFollowFeed(feedId);
    } catch (e) {
      rethrow;
    }
  }
}