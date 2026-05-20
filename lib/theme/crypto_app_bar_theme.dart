import 'package:clean_app/theme/palette.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class CryptoAppBarTheme {
  static AppBarThemeData get lightAppBar {
    return AppBarThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Palette.background,
        size: 25.sp,
      ),
      titleTextStyle: TextStyles.sectionTextStyle.copyWith(
        fontSize: 17.sp,
        color: Palette.background,
      ),
    );
  }

  static AppBarThemeData get darkAppBar {
    return AppBarThemeData(
      backgroundColor: Palette.background,
      surfaceTintColor: Palette.background,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Palette.white,
        size: 25.sp,
      ),
      titleTextStyle: TextStyles.sectionTextStyle.copyWith(
        fontSize: 17.sp,
      ),
    );
  }
}
