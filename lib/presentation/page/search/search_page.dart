import 'package:auto_route/auto_route.dart';
import 'package:clean_app/presentation/page/search/widget/widget.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
              child: ListView.separated(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return const CryptoCoinListTile();
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
