import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:rssagg_flutter/features/feeds/view/pages/feeds_screen.dart';
import 'package:rssagg_flutter/features/posts/data/data_provider/posts_data_provider.dart';
import 'package:rssagg_flutter/features/posts/data/repository/posts_repository.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';
import 'package:rssagg_flutter/theme/theme.dart';

import '../../bloc/posts_bloc.dart';
import '../widgets/posts_list.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  PostsBloc? postsBloc;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      final token = authState.user.token;
      postsBloc = PostsBloc(PostsRepository(PostsDataProvider(token)))
        ..add(FetchPostsEvent());
    } else {
      throw Exception("User not logged in");
    }
  }

  @override
  void dispose() {
    postsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => postsBloc!,
      child: Scaffold(
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
                        IconButton(
                          onPressed: () {
                            final auth = context.read<AuthBloc>();
                            auth.add(AuthLogoutRequested());
                          },
                          icon: const Icon(Icons.logout_rounded),
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
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const FeedsScreen();
                              },
                            ),
                          ).then((value) {
                            postsBloc?.add(FetchPostsEvent());
                          },);
                        },
                        icon: Icon(Icons.feed_rounded))
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
                Expanded(
                    child: BlocBuilder(
                  bloc: postsBloc,
                  builder: (context, state) {
                    if (state is PostsLoading) {
                      return const Center(child: LoadingIndicator());
                    } else if (state is PostsFetched) {
                      return PostsList(posts: state.posts);
                    } else if (state is PostsFetchFailed) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return const Center(
                      child: Text("No posts available"),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
