import 'package:flutter/material.dart';

sealed class AppColorScheme {
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color blackWithAlpha = Color.fromRGBO(0, 0, 0, 0.24);
  static const Color blackWithAlphaSecond = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color blackWithAlphaThird = Color.fromRGBO(0, 0, 0, 0.04);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color grey = Color.fromRGBO(112, 112, 112, 1);
  static const Color greyIndicator = Color.fromRGBO(217, 217, 217, 1);
  static const Color greyNavigation = Color.fromRGBO(204, 204, 204, 1);
  static const Color greySearch = Color.fromRGBO(241, 241, 241, 1);
  static const Color greyCategory = Color.fromRGBO(167, 171, 181, 1);
  static const Color bgCategoryItem = Color.fromRGBO(248, 248, 248, 1);
  static const Color addFavColorBg = Color.fromRGBO(245, 245, 247, 1);
}
