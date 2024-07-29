import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/utils/bottom_sheet.dart';
import 'package:rssagg_flutter/common/widgets/appbar.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:rssagg_flutter/features/feeds/bloc/feed_follows/feed_follows_bloc.dart';
import 'package:rssagg_flutter/features/feeds/data/data_provider/feeds_data_provider.dart';
import 'package:rssagg_flutter/features/feeds/data/repository/feeds_repository.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';
import '../../bloc/all_feeds/all_feeds_bloc.dart';
import '../../bloc/create_feed/create_feed_bloc.dart';
import '../widgets/create_feed_bottom_sheet.dart';
import '../widgets/feeds_list.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  AllFeedsBloc? allFeedsBloc;
  CreateFeedBloc? createFeedBloc;
  FeedFollowsBloc? feedFollowsBloc;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      final _feedsDataProvider = FeedsDataProvider(authState.user.token);
      final _feedsRepository = FeedsRepository(_feedsDataProvider);

      allFeedsBloc = AllFeedsBloc(_feedsRepository);
      createFeedBloc = CreateFeedBloc(_feedsRepository);
      feedFollowsBloc = FeedFollowsBloc(_feedsRepository);

      allFeedsBloc?.add(FetchAllFeedsEvent());
      feedFollowsBloc?.add(FetchFeedFollowsEvent());
    }
  }

  @override
  void dispose() {
    allFeedsBloc?.close();
    createFeedBloc?.close();
    feedFollowsBloc?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (allFeedsBloc == null || createFeedBloc == null) {
      return const Scaffold(
        body: Center(
          child: Text("User not logged in"),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => allFeedsBloc!,
        ),
        BlocProvider(
          create: (context) => createFeedBloc!,
        ),
        BlocProvider(
          create: (context) => feedFollowsBloc!,
        )
      ],
      child: BlocListener<FeedFollowsBloc, FeedFollowsState>(
        listener: (context, state) {
          if (state is FollowButtonError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: MyAppBar(
            context: context,
            title: "Feeds",
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Feeds',
                      style: AppTextStyle.title1,
                    ),
                    Text("Follow", style: AppTextStyle.label1),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocBuilder<AllFeedsBloc, AllFeedsState>(
                    builder: (context, state) {
                      if (state is AllFeedsLoading) {
                        return const Center(child: LoadingIndicator());
                      } else if (state is AllFeedsLoaded) {
                        return FeedsList(feeds: state.feeds);
                      } else if (state is AllFeedsError) {
                        return Center(child: Text(state.error));
                      }
                      return const Center(
                        child: Text("No feeds available"),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            //FOR BOTTOM SHEETS, you need to pass the bloc directly as contructor, this is the most simple and easy way
                            //The context in the bottom sheet is different from the context in the parent widget

                            //or wrap the build method of bottom sheet with BuildProvider.value and pass bloc as value

                            showMyBottomSheet(
                              context,
                              CreateFeedBottomSheet(
                                createFeedBloc: createFeedBloc!,
                                allFeedsBloc: allFeedsBloc!,
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Add Feed "),
                              Icon(Icons.add_rounded)
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
