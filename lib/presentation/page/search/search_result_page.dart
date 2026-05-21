import 'package:auto_route/auto_route.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/extensions/search_error_extension.dart';
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:clean_app/presentation/page/search/widget/crypto_coin_list_tile.dart';
import 'package:clean_app/presentation/page/search/widget/search_result_app_bar.dart';
import 'package:clean_app/presentation/page/search/widget/shimmer_coin_list_tile.dart';
import 'package:clean_app/theme/palette.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchResultAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.h,
          left: 15.w,
          right: 15.w,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            context
                .read<SearchBloc>()
                .add(const SearchEvent.getCoinsBySearchText());
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: Palette.primary,
          strokeWidth: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
                  final SearchStatus searchedCoinsStatus =
                      state.searchedCoinsStatus;
                  if (searchedCoinsStatus == SearchStatus.failure) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          state.searchErrorType.mapSearchErrorTypeToMessage(),
                          style: TextStyles.bodyMediumStyle.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    );
                  }
                  if (searchedCoinsStatus == SearchStatus.success) {
                    final List<Coin> searchedCoins = state.searchedCoins;
                    if (searchedCoins.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(
                          child: Text(
                            'coinsNotFound'.tr(),
                            style: TextStyles.bodyMediumStyle.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                      );
                    }
                    return SliverList.separated(
                      itemCount: searchedCoins.length,
                      itemBuilder: (_, int index) {
                        return CryptoCoinListTile(
                          coin: searchedCoins[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemCount: 15,
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
