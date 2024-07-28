part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsFetched extends PostsState {
  final List<Post> posts;
  PostsFetched(this.posts);
}

final class PostsFetchFailed extends PostsState {
  final String errorMessage;

  PostsFetchFailed(this.errorMessage);
}