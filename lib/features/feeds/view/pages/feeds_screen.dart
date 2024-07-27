import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/utils/bottom_sheet.dart';
import 'package:rssagg_flutter/common/widgets/appbar.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/features/auth/bloc/auth_bloc.dart';
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
  AllFeedsBloc? feedsBloc;
  CreateFeedBloc? createFeedBloc;

  @override
  void initState() {
    super.initState();
    final authState = context
        .read<AuthBloc>()
        .state;

    if (authState is AuthSuccess) {
      feedsBloc =
          AllFeedsBloc(
              FeedsRepository(FeedsDataProvider(authState.user.token)));
      feedsBloc?.add(FetchAllFeedsEvent());

      createFeedBloc = CreateFeedBloc(
          FeedsRepository(FeedsDataProvider(authState.user.token)));
    }

  }

  @override
  void dispose() {
    feedsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (feedsBloc == null || createFeedBloc == null) {
      return const Scaffold(
        body: Center(
          child: Text("User not logged in"),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => feedsBloc!,
        ),
        BlocProvider(
          create: (context) => createFeedBloc!,
        ),
      ],
      child: Scaffold(
        appBar: const MyAppBar(
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
                  Text("Created At", style: AppTextStyle.label1),
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
                          showMyBottomSheet(context, CreateFeedBottomSheet(
                            createFeedBloc: createFeedBloc!,
                          ));
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
    );
  }
}
