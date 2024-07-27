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
}
