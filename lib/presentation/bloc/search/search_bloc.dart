import 'dart:io';

import 'package:clean_app/backbone/bloc_status.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/domain/usecase/get_trending_coins.dart';
import 'package:clean_app/domain/usecase/search_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCoinsUseCase _searchCoinsUseCase;
  final GetTrendingCoinsUseCase _getTrendingCoinsUseCase;

  SearchBloc(
    this._searchCoinsUseCase,
    this._getTrendingCoinsUseCase,
  ) : super(SearchState.initial()) {
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
  ) async {
    emit(state.copyWith(status: BlocStatus.Loading));
    try {
      final List<Coin> searchedCoins = await _searchCoinsUseCase.call(
        state.searchText,
      );
      emit(state.copyWith(
        status: BlocStatus.Loaded,
        searchedCoins: searchedCoins,
      ));
    } on HttpException catch (e) {
      if (e.message == '429') {
        emit(state.copyWith(
          status: BlocStatus.Loaded,
        ));
      } else {
        emit(_errorState('Server error: ${e.message}'));
      }
    } on SocketException {
      emit(_errorState('No internet connection.'));
    } on FormatException {
      emit(_errorState('Bad response format.'));
    } catch (e) {
      emit(_errorState('An unexpected error occurred: $e'));
    }
  }

  SearchState _errorState(String message) => state.copyWith(
        status: BlocStatus.Error,
        error: message,
      );
}
