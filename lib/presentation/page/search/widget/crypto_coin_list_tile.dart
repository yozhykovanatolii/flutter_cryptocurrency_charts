import 'package:clean_app/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoCoinListTile extends StatelessWidget {
  const CryptoCoinListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.add_circle,
        size: 30.sp,
        color: Colors.white,
      ),
      title: Text(
        'Bitcoin',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: Palette.base4,
          borderRadius: BorderRadius.circular(
            7.r,
          ),
        ),
        child: Text(
          '1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
