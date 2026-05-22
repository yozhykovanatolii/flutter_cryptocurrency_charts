part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.fetchTopSevenTrendingCoins() =
      SearchFetchedTrendingCoinsEvent;

  const factory SearchEvent.changeSearchText({
    required String searchText,
  }) = SearchChangedSearchTextEvent;

  const factory SearchEvent.getCoinsBySearchText() = SearchCoinsEvent;
}
