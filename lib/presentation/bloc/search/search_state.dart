part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

enum SearchErrorType {
  noInternetConnection,
  badRequest,
  parsing,
  unknown,
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required SearchStatus trendingCoinsStatus,
    required SearchStatus searchedCoinsStatus,
    required List<Coin> trendingCoins,
    required List<Coin> searchedCoins,
    required String searchText,
    SearchErrorType? searchErrorType,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      trendingCoinsStatus: SearchStatus.initial,
      searchedCoinsStatus: SearchStatus.initial,
      trendingCoins: <Coin>[],
      searchedCoins: <Coin>[],
      searchText: '',
    );
  }
}
