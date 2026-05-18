// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:clean_app/presentation/page/market/market_page.dart' as _i2;
import 'package:clean_app/presentation/page/navigation_page.dart' as _i3;
import 'package:clean_app/presentation/page/ratings/detail_info_page.dart'
    as _i1;
import 'package:clean_app/presentation/page/ratings/ratings_page.dart' as _i4;
import 'package:clean_app/presentation/page/search/search_page.dart' as _i5;
import 'package:clean_app/presentation/page/search/search_result_page.dart'
    as _i6;
import 'package:clean_app/presentation/page/settings/settings_page.dart' as _i8;
import 'package:clean_app/presentation/router/search_wrapper_page.dart' as _i7;
import 'package:fl_chart/fl_chart.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.DetailInfoPage]
class DetailInfoRoute extends _i9.PageRouteInfo<DetailInfoRouteArgs> {
  DetailInfoRoute({
    required String coinName,
    required num currentPrice,
    required num priceChangePercentage,
    required num marketCap,
    required String imageUrl,
    required int coinIndex,
    required String symbol,
    required List<double>? sparkline,
    required List<_i10.FlSpot>? flSpotList,
    required String fiatCurrency,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          DetailInfoRoute.name,
          args: DetailInfoRouteArgs(
            coinName: coinName,
            currentPrice: currentPrice,
            priceChangePercentage: priceChangePercentage,
            marketCap: marketCap,
            imageUrl: imageUrl,
            coinIndex: coinIndex,
            symbol: symbol,
            sparkline: sparkline,
            flSpotList: flSpotList,
            fiatCurrency: fiatCurrency,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailInfoRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailInfoRouteArgs>();
      return _i1.DetailInfoPage(
        coinName: args.coinName,
        currentPrice: args.currentPrice,
        priceChangePercentage: args.priceChangePercentage,
        marketCap: args.marketCap,
        imageUrl: args.imageUrl,
        coinIndex: args.coinIndex,
        symbol: args.symbol,
        sparkline: args.sparkline,
        flSpotList: args.flSpotList,
        fiatCurrency: args.fiatCurrency,
        key: args.key,
      );
    },
  );
}

class DetailInfoRouteArgs {
  const DetailInfoRouteArgs({
    required this.coinName,
    required this.currentPrice,
    required this.priceChangePercentage,
    required this.marketCap,
    required this.imageUrl,
    required this.coinIndex,
    required this.symbol,
    required this.sparkline,
    required this.flSpotList,
    required this.fiatCurrency,
    this.key,
  });

  final String coinName;

  final num currentPrice;

  final num priceChangePercentage;

  final num marketCap;

  final String imageUrl;

  final int coinIndex;

  final String symbol;

  final List<double>? sparkline;

  final List<_i10.FlSpot>? flSpotList;

  final String fiatCurrency;

  final _i11.Key? key;

  @override
  String toString() {
    return 'DetailInfoRouteArgs{coinName: $coinName, currentPrice: $currentPrice, priceChangePercentage: $priceChangePercentage, marketCap: $marketCap, imageUrl: $imageUrl, coinIndex: $coinIndex, symbol: $symbol, sparkline: $sparkline, flSpotList: $flSpotList, fiatCurrency: $fiatCurrency, key: $key}';
  }
}

/// generated route for
/// [_i2.MarketPage]
class MarketRoute extends _i9.PageRouteInfo<void> {
  const MarketRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.MarketPage();
    },
  );
}

/// generated route for
/// [_i3.NavigationPage]
class NavigationRoute extends _i9.PageRouteInfo<void> {
  const NavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavigationPage();
    },
  );
}

/// generated route for
/// [_i4.RatingsPage]
class RatingsRoute extends _i9.PageRouteInfo<void> {
  const RatingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RatingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i4.RatingsPage();
    },
  );
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchPage();
    },
  );
}

/// generated route for
/// [_i6.SearchResultPage]
class SearchResultRoute extends _i9.PageRouteInfo<void> {
  const SearchResultRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchResultRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SearchResultPage();
    },
  );
}

/// generated route for
/// [_i7.SearchWrapperPage]
class SearchWrapperRoute extends _i9.PageRouteInfo<void> {
  const SearchWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchWrapperPage();
    },
  );
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}
