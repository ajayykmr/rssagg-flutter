import 'package:flutter/material.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';
import 'package:rssagg_flutter/models/models.dart';

import '../widgets/posts_list.dart';
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/583231?v=4'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Welcome back,',
                              style: AppTextStyle.highlightedLabel2,
                            ),
                            Text(
                              "Ajay Kumar",
                              style: AppTextStyle.title1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Posts',
                    style: AppTextStyle.title1,
                  ),
                  Text("Published At", style: AppTextStyle.label1),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(child: PostsList(posts: [],))
            ],
          ),
        ),
      ),
    );
  }
}
