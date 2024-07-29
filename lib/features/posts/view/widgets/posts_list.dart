import 'package:rssagg_flutter/common/utils/open_url.dart';
import 'package:rssagg_flutter/theme/theme.dart';
import 'package:rssagg_flutter/models/models.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        final date = posts[index].publishedAt;

        return InkWell(
          onTap: ()  async {
            print(post.url);
            openUrl(post.url);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        // backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/583231?v=4'),
                        child: Text(
                          (index + 1).toString(),
                          style: AppTextStyle.highlightedLabel1,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: AppTextStyle.title2,
                              ),
                              Text(
                                post.description.toString(),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.label1,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${date.day}/${date.month}/${date.year}",
                    style: AppTextStyle.label1,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
