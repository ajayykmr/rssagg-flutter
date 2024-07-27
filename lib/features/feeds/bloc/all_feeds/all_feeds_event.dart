part of 'all_feeds_bloc.dart';

@immutable
sealed class AllFeedsEvent {}

final class FetchAllFeedsEvent extends AllFeedsEvent {}
