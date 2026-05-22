import 'dart:io';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/domain/usecase/get_trending_coins.dart';
import 'package:clean_app/domain/usecase/search_coins.dart';
import 'package:clean_app/exception/trending_coins_request_exception.dart';
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
  ) async {
    emit(state.copyWith(trendingCoinsStatus: SearchStatus.loading));
    try {
      final List<Coin> trendingCoins = await _getTrendingCoinsUseCase.call();
      emit(state.copyWith(
        trendingCoinsStatus: SearchStatus.success,
        trendingCoins: trendingCoins,
      ));
    } on TrendingCoinsRequestException {
      emit(
        state.copyWith(
          trendingCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.badRequest,
        ),
      );
    } on SocketException {
      emit(
        state.copyWith(
          trendingCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.noInternetConnection,
        ),
      );
    } on FormatException {
      emit(
        state.copyWith(
          trendingCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.parsing,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          trendingCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.unknown,
        ),
      );
    }
  }

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
    emit(state.copyWith(searchedCoinsStatus: SearchStatus.loading));
    try {
      final List<Coin> searchedCoins = await _searchCoinsUseCase.call(
        state.searchText,
      );
      emit(
        state.copyWith(
          searchedCoinsStatus: SearchStatus.success,
          searchedCoins: searchedCoins,
        ),
      );
    } on TrendingCoinsRequestException {
      emit(
        state.copyWith(
          searchedCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.badRequest,
        ),
      );
    } on SocketException {
      emit(
        state.copyWith(
          searchedCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.noInternetConnection,
        ),
      );
    } on FormatException {
      emit(
        state.copyWith(
          searchedCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.parsing,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          searchedCoinsStatus: SearchStatus.failure,
          searchErrorType: SearchErrorType.unknown,
        ),
      );
    }
  }
}
