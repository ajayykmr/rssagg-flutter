import 'dart:convert';

import 'package:rssagg_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import '../../../../common/utils/utils.dart';

class PostsDataProvider {
  final BASE_URL = Constants.BASE_URL;
  final String authToken;

  PostsDataProvider(this.authToken);

  Future<List<Post>> getPostsForUser() async {
    try {

      //fetch posts for user
      final res = await http.get(
        headers: getAuthHeader(authToken),
        Uri.parse('$BASE_URL/posts/user'),
      );

      if (res.statusCode!=200) {
        throw Exception(res.body);
      }

      final jsonMap = jsonDecode(res.body) as Map<String, dynamic>;

      final List<Post> posts =(jsonMap['posts'].map<Post>((post) => Post.fromJson(post))).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }



}