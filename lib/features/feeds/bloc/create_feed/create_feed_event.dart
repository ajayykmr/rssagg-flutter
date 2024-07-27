part of 'create_feed_bloc.dart';

final class CreateFeedEvent {
  final String feedName;
  final String feedUrl;


  CreateFeedEvent({
    required this.feedName,
    required this.feedUrl,

  });
}
