import 'package:auto_route/auto_route.dart';
import 'package:clean_app/presentation/page/search/widget/crypto_coin_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            context.router.maybePop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        title: Text(
          'searchedResult'.tr(args: <String>['bit']),
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
      ),
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
