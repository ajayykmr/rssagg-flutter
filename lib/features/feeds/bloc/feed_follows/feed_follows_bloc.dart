import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rssagg_flutter/features/feeds/data/repository/feeds_repository.dart';

part 'feed_follows_event.dart';
part 'feed_follows_state.dart';

class FeedFollowsBloc extends Bloc<FeedFollowsEvent, FeedFollowsState> {

  final FeedsRepository _feedsRepository;

  FeedFollowsBloc(this._feedsRepository) : super(FeedFollowsInitial()) {
    on<FetchFeedFollowsEvent>(_fetchFeedFollows);
    on<FollowFeedEvent>(_followFeed);
    on<UnFollowFeedEvent>(_unFollowFeed);
    on<ReloadFeedFollowsEvent>(_reloadFeedFollows);
  }

  void _fetchFeedFollows(FetchFeedFollowsEvent event, Emitter<FeedFollowsState> emit) async {
    emit(FeedFollowsLoading());
    try {
      final feedFollows = await _feedsRepository.getUserFeedFollows();


      //feedID, feedFollowsID
      Map<String, String> feedFollowsMap = {};
      for(int i=0;i<feedFollows.length;i++){
        feedFollowsMap[feedFollows[i].feedId] = feedFollows[i].id;
      }
      emit(FeedFollowsLoaded(feedFollowsMap));

    } catch (e) {
      print(e);
      emit(FeedFollowsError(e.toString()));
    }
  }

  void _followFeed(FollowFeedEvent event, Emitter<FeedFollowsState> emit) async {
    try {
      await _feedsRepository.followFeed(event.feedId);
      add(ReloadFeedFollowsEvent());
    } catch (e) {
      print(e);
      emit(FollowButtonError(e.toString()));
    }
  }

  Future<void> _unFollowFeed(UnFollowFeedEvent event, Emitter<FeedFollowsState> emit) async {
    try {
      await _feedsRepository.unfollowFeed(event.feedFollowId);
      add(ReloadFeedFollowsEvent());
    } catch (e) {
      print(e);
      emit(FollowButtonError(e.toString()));
    }
  }



  Future<void> _reloadFeedFollows(ReloadFeedFollowsEvent event, Emitter<FeedFollowsState> emit) async {
    try {
      final newFeedFollows = await _feedsRepository.getUserFeedFollows();

      //feedID, feedFollowsID
      Map<String, String> newMap = {};
      for(int i=0;i<newFeedFollows.length;i++){
        newMap[newFeedFollows[i].feedId] = newFeedFollows[i].id;
      }
      emit(FeedFollowsLoaded(newMap));
    } catch (e) {
      print(e);
      emit(FeedFollowsError(e.toString()));
    }
  }
}
