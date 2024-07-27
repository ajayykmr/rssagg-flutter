import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rssagg_flutter/models/models.dart';

import '../../data/repository/feeds_repository.dart';

part 'all_feeds_event.dart';
part 'all_feeds_state.dart';

class AllFeedsBloc extends Bloc<AllFeedsEvent, AllFeedsState> {

  final FeedsRepository _feedsRepository;

  AllFeedsBloc(this._feedsRepository) : super(AllFeedsInitial()) {
    on<FetchAllFeedsEvent>(_onFetchAllFeedsEvent);

  }

  void _onFetchAllFeedsEvent(FetchAllFeedsEvent event, Emitter<AllFeedsState> emit) async {
    emit(AllFeedsLoading());
    try {
      final feeds = await _feedsRepository.fetchAllFeeds();
      emit(AllFeedsLoaded(feeds));
    } catch (e) {
      print(e);
      emit(AllFeedsError(e.toString()));
    }
  }
}
