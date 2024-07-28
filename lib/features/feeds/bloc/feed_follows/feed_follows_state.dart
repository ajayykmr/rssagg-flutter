part of 'feed_follows_bloc.dart';

@immutable
sealed class FeedFollowsState {}

final class FeedFollowsInitial extends FeedFollowsState {}

final class FeedFollowsLoading extends FeedFollowsState {}

final class FeedFollowsLoaded extends FeedFollowsState {
  //set of feed IDs
  final List<FeedFollow> feedFollows;
  FeedFollowsLoaded(this.feedFollows);
}

final class FeedFollowsError extends FeedFollowsState {
  final String message;
  FeedFollowsError(this.message);
}
