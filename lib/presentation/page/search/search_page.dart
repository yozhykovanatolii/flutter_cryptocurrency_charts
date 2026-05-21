import 'package:auto_route/auto_route.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/extensions/search_error_extension.dart';
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:clean_app/presentation/page/search/widget/widget.dart';
import 'package:clean_app/theme/palette.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context
        .read<SearchBloc>()
        .add(const SearchEvent.fetchTopSevenTrendingCoins());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: Palette.primary,
          strokeWidth: 2,
          onRefresh: () async {
            context
                .read<SearchBloc>()
                .add(const SearchEvent.fetchTopSevenTrendingCoins());
          },
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: CryptoSearchBar(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30.h),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'top_seven_trending_coins'.tr(),
                  style: TextStyles.sectionTextStyle.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30.h),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  final SearchStatus trendingCoinsStatus =
                      state.trendingCoinsStatus;
                  if (trendingCoinsStatus == SearchStatus.failure) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          state.searchErrorType.mapSearchErrorTypeToMessage(),
                          textAlign: TextAlign.center,
                          style: TextStyles.bodyMediumStyle.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    );
                  }
                  if (trendingCoinsStatus == SearchStatus.success) {
                    final List<Coin> trendingCoins = state.trendingCoins;
                    return SliverList.separated(
                      itemCount: trendingCoins.length,
                      itemBuilder: (_, int index) {
                        return CryptoCoinListTile(
                          coin: trendingCoins[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemCount: 7,
                    itemBuilder: (_, int index) {
                      return const ShimmerCoinListTile();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10.h,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
