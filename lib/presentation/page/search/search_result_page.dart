import 'package:auto_route/auto_route.dart';
import 'package:clean_app/backbone/bloc_status.dart';
import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:clean_app/presentation/page/search/widget/crypto_coin_list_tile.dart';
import 'package:clean_app/presentation/page/search/widget/search_result_app_bar.dart';
import 'package:clean_app/presentation/widget/refresh_button.dart';
import 'package:clean_app/presentation/widget/shimmers/shimmer_coin_list_view.dart';
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
        padding: EdgeInsets.only(top: 15.h),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (BuildContext context, SearchState state) {
            final BlocStatus status = state.status;
            if (status == BlocStatus.Error) {
              return const Center(
                child: RefreshButton(),
              );
            }
            if (status == BlocStatus.Loaded) {
              final List<Coin> searchedCoins = state.searchedCoins;
              return ListView.separated(
                itemCount: searchedCoins.length,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                itemBuilder: (_, int index) {
                  return const CryptoCoinListTile();
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              );
            }
            return const ShimmerCoinListView(itemCount: 15);
          },
        ),
      ),
    );
  }
}
