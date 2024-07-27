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
      itemCount: 10,

      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
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
                      children: [
                        Text(
                          'Title',
                          style: AppTextStyle.title2,
                        ),
                        Text(
                          'Description',
                          style: AppTextStyle.highlightedLabel1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Date", style: AppTextStyle.label1),
                  Text("Feed Name", style: AppTextStyle.label1,),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
