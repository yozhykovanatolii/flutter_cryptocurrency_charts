import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/domain/service/coin.dart';

abstract class SearchCoinsUseCase {
  Future<List<Coin>> call(String searchText);
}

class RestSearchCoinsUseCase implements SearchCoinsUseCase {
  final CoinService _coinService;

  RestSearchCoinsUseCase(this._coinService);

  @override
  Future<List<Coin>> call(String searchText) =>
      _coinService.getCoinsBySearchText(searchText);
}
