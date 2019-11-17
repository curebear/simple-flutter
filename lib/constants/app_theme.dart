import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    fontFamily: 'NotoSans',
    brightness: Brightness.light,
    primarySwatch: MaterialColor(
        AppColors.green[500].value, AppColors.green),
    primaryColor: AppColors.green[500],
    primaryColorBrightness: Brightness.light,
    accentColor: AppColors.green[500],
    accentColorBrightness: Brightness.light
);

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Map<int, Color> green = const <int, Color>{
    50: const Color(0xFFf2f8ef),
    100: const Color(0xFFdfedd8),
    200: const Color(0xFFc9e2be),
    300: const Color(0xFFb3d6a4),
    400: const Color(0xFFa3cd91),
    500: const Color(0xFF93c47d),
    600: const Color(0xFF8bbe75),
    700: const Color(0xFF80b66a),
    800: const Color(0xFF76af60),
    900: const Color(0xFF64a24d)
  };
}