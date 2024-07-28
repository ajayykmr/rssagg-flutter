import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rssagg_flutter/features/feeds/data/repository/feeds_repository.dart';
import 'package:rssagg_flutter/models/models.dart';

part 'feed_follows_event.dart';
part 'feed_follows_state.dart';

class FeedFollowsBloc extends Bloc<FeedFollowsEvent, FeedFollowsState> {

  final FeedsRepository _feedsRepository;

  FeedFollowsBloc(this._feedsRepository) : super(FeedFollowsInitial()) {
    on<FetchFeedFollowsEvent>(_fetchFeedFollows);
    on<FollowFeedEvent>(_followFeed);
    on<UnFollowFeedEvent>(_unFollowFeed);
  }

  void _fetchFeedFollows(FetchFeedFollowsEvent event, Emitter<FeedFollowsState> emit) async {
    emit(FeedFollowsLoading());
    try {
      final feedFollows = await _feedsRepository.getUserFeedFollows();

      // Set<String> feedsSet = feedFollows.map((e) => e.feedId).toSet();

      emit(FeedFollowsLoaded(feedFollows));
    } catch (e) {
      print(e);
      emit(FeedFollowsError(e.toString()));
    }
  }

  void _followFeed(FollowFeedEvent event, Emitter<FeedFollowsState> emit) async {
    try {
      await _feedsRepository.followFeed(event.feedId);
    } catch (e) {
      print(e);
      emit(FeedFollowsError(e.toString()));
    }
  }

  Future<void> _unFollowFeed(UnFollowFeedEvent event, Emitter<FeedFollowsState> emit) async {
    try {
      await _feedsRepository.unfollowFeed(event.feedId);
    } catch (e) {
      print(e);
    }
  }
}
