import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rssagg_flutter/features/feeds/data/repository/feeds_repository.dart';

import '../../../../models/models.dart';

part 'create_feed_event.dart';

part 'create_feed_state.dart';

class CreateFeedBloc extends Bloc<CreateFeedEvent, CreateFeedState> {
  final FeedsRepository _feedsRepository;

  CreateFeedBloc(this._feedsRepository) : super(CreateFeedInitial()) {
    on<CreateFeedEvent>(_onCreateFeedEvent);
  }

  void _onCreateFeedEvent(
      CreateFeedEvent event, Emitter<CreateFeedState> emit) async {
    emit(CreateFeedLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      final feedName = event.feedName;
      final feedUrl = event.feedUrl;


      await _feedsRepository.createFeed(feedName,feedUrl);
      emit(CreateFeedSuccess());
    } catch (e) {
      print(e);
      emit(CreateFeedFailure(e.toString()));
    }
  }
}
