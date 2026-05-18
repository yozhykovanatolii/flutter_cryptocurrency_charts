import 'package:clean_app/theme/palette.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoSearchBar extends StatelessWidget {
  const CryptoSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        filled: true,
        fillColor: Palette.warmBlack,
        suffixIcon: Icon(
          Icons.search,
          size: 28.sp,
        ),
        suffixIconColor: Palette.primary,
        hintText: 'search'.tr(),
        hintStyle: TextStyle(
          color: const Color(0xFFBDBDBD),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
