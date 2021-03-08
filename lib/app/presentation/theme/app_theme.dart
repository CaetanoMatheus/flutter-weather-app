import 'package:flutter/material.dart';

enum AppThemeMode { Day, Night }

class AppTheme {
  static Color shimmer = Colors.white.withOpacity(.6);
  static Color shimmerBase = Colors.grey.shade300;
  static Color shimmerHighlight = Colors.grey.shade100;

  static double radius = 10;

  static ThemeData appThemeData(AppThemeMode theme) {
    return theme == AppThemeMode.Night ? nightTheme() : dayTheme();
  }

  static ThemeData dayTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF5AC8FA),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xFF002148)),
        bodyText2: TextStyle(color: Color(0xFF22436A)),
      ),
    );
  }

  static ThemeData nightTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF232634),
      scaffoldBackgroundColor: Colors.transparent,
    );
  }
}
