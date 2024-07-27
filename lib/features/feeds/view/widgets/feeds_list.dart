
import 'package:flutter/material.dart';
import 'package:rssagg_flutter/models/models.dart';
import 'package:rssagg_flutter/theme/theme.dart';

class FeedsList extends StatelessWidget {
  final List<Feed> feeds;
  const FeedsList({super.key, required this.feeds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      shrinkWrap: false,
      itemCount: feeds.length,

      itemBuilder: (context, index) {
        final feed = feeds[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    CircleAvatar(
                      radius: 21,
                      child: Text((index+1).toString(), style: AppTextStyle.highlightedLabel1,),
                      // backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/583231?v=4'),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feed.name,
                              style: AppTextStyle.title2,
                            ),
                            Text(
                              feed.url,
                              style: AppTextStyle.highlightedLabel1,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${feed.createdAt.day}/${feed.createdAt.month}/${feed.createdAt.year}", style: AppTextStyle.label1),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
