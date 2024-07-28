part of 'all_feeds_bloc.dart';

@immutable
sealed class AllFeedsState {}

final class AllFeedsInitial extends AllFeedsState {}

final class AllFeedsLoading extends AllFeedsState {}

final class AllFeedsLoaded extends AllFeedsState {
  final List<Feed> feeds;
  AllFeedsLoaded(this.feeds);
}

final class AllFeedsError extends AllFeedsState {
  final String error;

  AllFeedsError(this.error);
}