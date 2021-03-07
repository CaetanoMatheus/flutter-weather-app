import 'package:flutter/material.dart';

abstract class AppTheme {
  static LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5BD9D7), Color(0xFF5AC8FA)],
  );

  static Color shimmer = Colors.white.withOpacity(.6);
  static Color shimmerBase = Colors.grey.shade300;
  static Color shimmerHighlight = Colors.grey.shade100;

  static double radius = 10;
}
