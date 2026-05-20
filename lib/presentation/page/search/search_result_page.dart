import 'package:auto_route/auto_route.dart';
import 'package:clean_app/presentation/page/search/widget/crypto_coin_list_tile.dart';
import 'package:clean_app/presentation/page/search/widget/search_result_app_bar.dart';
import 'package:flutter/material.dart';
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
        child: ListView.separated(
          itemCount: 10,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const CryptoCoinListTile();
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 10.h,
          ),
        ),
      ),
    );
  }
}
