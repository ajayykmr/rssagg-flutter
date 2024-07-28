import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../data/repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final PostsRepository _postsRepository;

  PostsBloc(this._postsRepository) : super(PostsInitial()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await _postsRepository.getPostsForUser();
        emit(PostsFetched(posts));
      } catch (e) {
        emit(PostsFetchFailed(e.toString()));
      }
    });
  }
}
