import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/theme/app_text_theme.dart';

sealed class AppTheme {
  static ThemeData get appTheme => ThemeData(
        textTheme: AppTextTheme.appTextTheme,
        fontFamily: AppTextTheme.fontFamily,
        scaffoldBackgroundColor: AppColorScheme.white,
        primaryColor: AppColorScheme.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColorScheme.white,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
      );
}
