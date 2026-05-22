import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/domain/service/coin.dart';

abstract class GetTrendingCoinsUseCase {
  Future<List<Coin>> call();
}

class RestGetTrendingCoinsUseCase implements GetTrendingCoinsUseCase {
  final CoinService _coinService;

  RestGetTrendingCoinsUseCase(this._coinService);

  @override
  Future<List<Coin>> call() => _coinService.getTrendingCoins();
}
