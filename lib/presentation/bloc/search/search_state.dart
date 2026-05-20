part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required SearchStatus trendingCoinsStatus,
    required SearchStatus searchedCoinsStatus,
    required BlocStatus status,
    required List<Coin> trendingCoins,
    required List<Coin> searchedCoins,
    required String searchText,
    Object? error,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      trendingCoinsStatus: SearchStatus.initial,
      searchedCoinsStatus: SearchStatus.initial,
      status: BlocStatus.Loading,
      trendingCoins: <Coin>[],
      searchedCoins: <Coin>[],
      searchText: '',
      error: null,
    );
  }
}
