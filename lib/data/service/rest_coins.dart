import 'package:clean_app/assembly/factory.dart';
import 'package:clean_app/data/gateway/rest.dart';
import 'package:clean_app/data/model/coin.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/domain/service/coin.dart';

class RestCoinService implements CoinService {
  final RestGateway _gateway;
  final Factory<Coin, CoinDto> _factory;
  RestCoinService(this._gateway, this._factory);

  @override
  Future<List<Coin>> getMarketsCoins(String currency, String order,
      int pageNumber, int perPage, String sparkline) async {
    final List<CoinDto> dtoList = await _gateway.getMarketsCoins(
      currency,
      order,
      pageNumber,
      perPage,
      sparkline,
    );
    return dtoList.map((CoinDto dto) => _factory.create(dto)).toList();
  }

  @override
  Future<List<Coin>> getTrendingCoins() async {
    final List<CoinDto> trendingCoinsDto = await _gateway.getTrendingCoins();
    final List<CoinDto> topSevenTrendingCoins =
        trendingCoinsDto.getRange(0, 7).toList();
    return topSevenTrendingCoins
        .map((CoinDto dto) => _factory.create(dto))
        .toList();
  }

  @override
  Future<List<Coin>> getCoinsBySearchText(String searchText) async {
    final List<CoinDto> searchedCoinsDto = await _gateway.getCoinsBySearchText(
      searchText,
    );
    return searchedCoinsDto.map((CoinDto dto) => _factory.create(dto)).toList();
  }
}
