import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/common/widgets/loading_indicator.dart';
import 'package:rssagg_flutter/common/widgets/text_field.dart';
import 'package:rssagg_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:rssagg_flutter/features/feeds/bloc/all_feeds/all_feeds_bloc.dart';
import 'package:rssagg_flutter/theme/theme.dart';
import '../../bloc/create_feed/create_feed_bloc.dart';

class CreateFeedBottomSheet extends StatefulWidget {
  final CreateFeedBloc createFeedBloc;

  const CreateFeedBottomSheet({super.key, required this.createFeedBloc});

  @override
  State<CreateFeedBottomSheet> createState() => _CreateFeedBottomSheetState();
}

class _CreateFeedBottomSheetState extends State<CreateFeedBottomSheet> {
  final feedNameController = TextEditingController();
  final feedUrlController = TextEditingController();

  @override
  void dispose() {
    feedNameController.dispose();
    feedUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.createFeedBloc,
      listener: (context, state) {
        if (state is CreateFeedSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
          padding: const EdgeInsets.only(
            bottom: 20,
            right: 16,
            left: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextFormField(
                controller: feedNameController,
                title: "Feed Name",
              ),
              const SizedBox(
                height: 21,
              ),
              MyTextFormField(
                title: "Feed URL",
                controller: feedUrlController,
              ),
              const SizedBox(
                height: 21,
              ),
              BlocBuilder(
                bloc: widget.createFeedBloc,
                builder: (context, state) {
                  if (state is CreateFeedLoading) {
                    return const LoadingIndicator();
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (state is CreateFeedFailure)
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            state.error,
                            style: AppTextStyle.highlightedLabel1,
                          ),
                        )),
                      ElevatedButton(
                        onPressed: () {
                          widget.createFeedBloc.add(CreateFeedEvent(
                            feedName: feedNameController.text,
                            feedUrl: feedUrlController.text,
                          ));

                          final feedBloc = context.read<AllFeedsBloc>();
                          feedBloc.add(FetchAllFeedsEvent());
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                            ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Create Feed"),
                            Icon(Icons.add_rounded),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          )),
    );
  }

  void createFeed() {}
}
