import 'package:clean_app/backbone/bloc_status.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<SearchFetchedTrendingCoinsEvent>(_fetchTrendingCoins);
    on<SearchChangedSearchTextEvent>(_changeSearchText);
    on<SearchCoinsEvent>(_searchCoins);
  }

  Future<void> _fetchTrendingCoins(
    SearchFetchedTrendingCoinsEvent event,
    Emitter<SearchState> emit,
  ) async {}

  Future<void> _changeSearchText(
    SearchChangedSearchTextEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _searchCoins(
    SearchCoinsEvent event,
    Emitter<SearchState> emit,
  ) async {}
}
