import 'package:rssagg_flutter/features/posts/data/data_provider/posts_data_provider.dart';

import '../../../../models/models.dart';

class PostsRepository {
  final PostsDataProvider _postsDataProvider;

  PostsRepository(this._postsDataProvider);

  Future<List<Post>> getPostsForUser() async {
    try {
      return await _postsDataProvider.getPostsForUser();
    } catch (e) {
      rethrow;
    }
  }
}