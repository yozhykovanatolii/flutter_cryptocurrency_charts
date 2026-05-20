import 'package:auto_route/auto_route.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:clean_app/presentation/page/search/widget/widget.dart';
import 'package:clean_app/presentation/widget/refresh_button.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CryptoSearchBar(),
            SizedBox(height: 30.h),
            Text(
              'top_seven_trending_coins'.tr(),
              style: TextStyles.sectionTextStyle.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  final SearchStatus trendingCoinsStatus =
                      state.trendingCoinsStatus;
                  if (trendingCoinsStatus == SearchStatus.failure) {
                    return const Center(
                      child: RefreshButton(),
                    );
                  }
                  if (trendingCoinsStatus == SearchStatus.success) {
                    final List<Coin> trendingCoins = state.trendingCoins;
                    return ListView.separated(
                      itemCount: trendingCoins.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
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
                  return ListView.separated(
                    itemCount: 7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
