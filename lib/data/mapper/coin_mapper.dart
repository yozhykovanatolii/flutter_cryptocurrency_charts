// ignore: avoid_classes_with_only_static_members
class CoinMapper {
  static Map<String, dynamic> normalizeTrendingCoins(
      Map<String, dynamic> json) {
    final Map<String, dynamic> item = json['item'];

    return <String, dynamic>{
      'id': item['id'],
      'symbol': item['symbol'],
      'name': item['name'],
      'image': item['thumb'],
      'current_price': item['data']?['price'],
      'market_cap': item['market_cap_rank'],
      'price_change_percentage_24h': 0,
      'sparkline_in_7d': <String, dynamic>{'price': <dynamic>[]},
    };
  }

  static Map<String, dynamic> normalizeSearchedCoins(
      Map<String, dynamic> json) {
    return <String, dynamic>{
      'id': json['id'],
      'symbol': json['symbol'],
      'name': json['name'],
      'image': json['thumb'],
      'current_price': 0,
      'market_cap': json['market_cap_rank'],
      'price_change_percentage_24h': 0,
      'sparkline_in_7d': <String, dynamic>{'price': <dynamic>[]},
    };
  }
}
