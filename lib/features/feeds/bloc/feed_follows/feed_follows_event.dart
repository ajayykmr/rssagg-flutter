part of 'feed_follows_bloc.dart';

@immutable
sealed class FeedFollowsEvent {}

final class FetchFeedFollowsEvent extends FeedFollowsEvent {}

final class FollowFeedEvent extends FeedFollowsEvent {
  final String feedId;
  FollowFeedEvent(this.feedId);
}

final class UnFollowFeedEvent extends FeedFollowsEvent {
  final String feedFollowId;
  UnFollowFeedEvent(this.feedFollowId);
}

final class ReloadFeedFollowsEvent extends FeedFollowsEvent {}