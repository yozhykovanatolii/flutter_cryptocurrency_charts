import 'package:clean_app/domain/entity/coin.dart';
import 'package:clean_app/theme/palette.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoCoinListTile extends StatelessWidget {
  final Coin coin;

  const CryptoCoinListTile({
    required this.coin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.network(
        coin.image!,
        width: 30.w,
        height: 30.h,
      ),
      title: Text(coin.name!),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: Palette.base4,
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Text(
          '${coin.marketCap}',
          style: TextStyles.bodyMediumStyle,
        ),
      ),
    );
  }
}
