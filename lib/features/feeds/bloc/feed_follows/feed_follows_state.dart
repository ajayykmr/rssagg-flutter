part of 'feed_follows_bloc.dart';

@immutable
sealed class FeedFollowsState {}

final class FeedFollowsInitial extends FeedFollowsState {}

final class FeedFollowsLoading extends FeedFollowsState {}

final class FeedFollowsLoaded extends FeedFollowsState {
  //map [feedID][FeedFollowID]
  final Map<String, String> feedFollows;
  FeedFollowsLoaded(this.feedFollows);
}

final class FeedFollowsError extends FeedFollowsState {
  final String message;
  FeedFollowsError(this.message);
}

final class FollowButtonError extends FeedFollowsState {
  final String message;
  FollowButtonError(this.message);
}

//reload feed after follow button pressed
final class FeedFollowsReloading extends FeedFollowsState {}