import 'package:clean_app/domain/entity/coin.dart';

abstract class CoinService {
  Future<List<Coin>> getMarketsCoins(
    String currency,
    String order,
    int pageNumber,
    int perPage,
    String sparkline,
  );

  Future<List<Coin>> getTrendingCoins();

  Future<List<Coin>> getCoinsBySearchText(String searchText);
}
