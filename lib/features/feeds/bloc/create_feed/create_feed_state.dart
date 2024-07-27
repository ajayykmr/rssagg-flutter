part of 'create_feed_bloc.dart';

@immutable
sealed class CreateFeedState {}

final class CreateFeedInitial extends CreateFeedState {}

final class CreateFeedLoading extends CreateFeedState {}

final class CreateFeedSuccess extends CreateFeedState {}

final class CreateFeedFailure extends CreateFeedState {
  final String error;
  CreateFeedFailure(this.error);
}