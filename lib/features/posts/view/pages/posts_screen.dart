import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:rssagg_flutter/features/feeds/view/pages/feeds_screen.dart';
import 'package:rssagg_flutter/features/posts/data/data_provider/posts_data_provider.dart';
import 'package:rssagg_flutter/features/posts/data/repository/posts_repository.dart';
import 'package:rssagg_flutter/theme/textstyle.dart';
import 'package:rssagg_flutter/theme/theme.dart';

import '../../../auth/view/pages/sign_in_screen.dart';
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
    
    final authState = context
        .read<AuthBloc>()
        .state;

    if (authState is AuthSuccess) {
      final token = authState.user.token;
      postsBloc = PostsBloc(PostsRepository(PostsDataProvider(token)))
        ..add(FetchPostsEvent());
    }
  }

  @override
  void dispose() {
    postsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (postsBloc == null) {
      return const Center(child: Text("No posts available"));
    }
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUserLoggedOut){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        }
      },
      child: BlocProvider(
        create: (context) => postsBloc!,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              final auth = context.read<AuthBloc>();
                              auth.add(AuthLogoutRequested());
                            },
                            child: Column(
                              children: [
                                const Icon(Icons.logout_rounded),

                                Text(
                                  'Logout',
                                  style: AppTextStyle.label1.copyWith(
                                    fontSize: 12
                                  ),
                                ),
                              ],

                            ),
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
                                  "AnonymousPenguin",
                                  style: AppTextStyle.title1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
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
                        child:  Column(
                          children: [
                            const Icon(Icons.feed_rounded),
                            Text(
                              'Feeds',
                              style: AppTextStyle.label1.copyWith(
                                  fontSize: 12
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }
}
