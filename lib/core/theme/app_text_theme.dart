import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';

sealed class AppTextTheme {
  static const String fontFamily = 'Almarai';

  static TextTheme get appTextTheme => const TextTheme(
        displayLarge: TextStyle(
          color: AppColorScheme.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: AppColorScheme.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: AppColorScheme.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      );
}
