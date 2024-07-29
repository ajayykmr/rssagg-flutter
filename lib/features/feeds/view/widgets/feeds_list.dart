import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/models/models.dart';
import 'package:rssagg_flutter/theme/theme.dart';
import '../../bloc/feed_follows/feed_follows_bloc.dart';

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
                      child: Text(
                        (index + 1).toString(),
                        style: AppTextStyle.highlightedLabel1,
                      ),
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
              BlocBuilder<FeedFollowsBloc, FeedFollowsState>(
                builder: (context, state) {
                  final feedFollowsBloc =
                      BlocProvider.of<FeedFollowsBloc>(context);


                  if (state is FeedFollowsLoading){
                    return LoadingIndicator(
                      size: 15,
                    );
                  }
                  if (state is FeedFollowsError) {
                    //error
                    return IconButton(
                      onPressed: () {
                        feedFollowsBloc.add(FetchFeedFollowsEvent());
                      },
                      icon: Icon(
                        Icons.refresh_rounded,
                        size: 20,
                      ),
                    );
                  }

                  if (state is FeedFollowsLoaded) {
                    //feedID, feedFollowID
                    final feedFollowMap = state.feedFollows;
                    bool following = feedFollowMap.containsKey(feed.id);

                    return IconButton(
                      onPressed: () {
                        if (following) {
                          feedFollowsBloc
                              .add(UnFollowFeedEvent(feedFollowMap[feed.id]!));
                        } else {
                          feedFollowsBloc.add(FollowFeedEvent(feed.id));
                        }
                      },
                      icon: Icon(
                        following
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 20,
                        color: following ? Colors.red : Colors.grey,
                      ),
                    );
                  }
                  return IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
