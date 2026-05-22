import 'package:clean_app/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCoinListTile extends StatelessWidget {
  const ShimmerCoinListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Palette.overlay1,
      baseColor: Palette.base4,
      child: Row(
        children: <Widget>[
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).hintColor,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 12.h,
                  width: 120.w,
                  color: Theme.of(context).hintColor,
                ),
                SizedBox(height: 6.h),
                Container(
                  height: 10.h,
                  width: 80.w,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
          ),
          Container(
            width: 50.w,
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
