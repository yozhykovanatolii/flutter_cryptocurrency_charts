part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required BlocStatus status,
    required List<Coin> trendingCoins,
    required List<Coin> searchedCoins,
    required String searchText,
    Object? error,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      status: BlocStatus.Loading,
      trendingCoins: <Coin>[],
      searchedCoins: <Coin>[],
      searchText: '',
      error: null,
    );
  }
}
