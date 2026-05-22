import 'package:clean_app/theme/palette.dart';
import 'package:clean_app/theme/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class CryptoListTileTheme {
  static ListTileThemeData get lightListTile {
    return ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      titleTextStyle: TextStyles.sectionTextStyle.copyWith(
        color: Palette.background,
      ),
    );
  }

  static ListTileThemeData get darkListTile {
    return ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      titleTextStyle: TextStyles.sectionTextStyle.copyWith(
        color: Palette.white,
      ),
    );
  }
}
