import 'package:flutter/material.dart';

abstract class ImageResolver {
  static const String iconsPath = 'assets/images/images';
  static const String iconsExtension = 'png';

  static const String airHumidity = '$iconsPath/air-humidity.$iconsExtension';
  static const String wind = '$iconsPath/wind-speed.$iconsExtension';

  static const String dayCloudy = '$iconsPath/day-cloudy.$iconsExtension';

  static const String nightCloudy = '$iconsPath/night-cloudy.$iconsExtension';

  static String? getAssetImageFromWeatherCondition(
      String condition, bool isDay) {
    if (isDay) {
      switch (condition.toLowerCase()) {
        case 'partly cloudy':
          return dayCloudy;
        case 'cloudy':
          return dayCloudy;
        default:
          return null;
      }
    }
    switch (condition.toLowerCase()) {
      case 'partly cloudy':
        return nightCloudy;
      case 'cloudy':
        return nightCloudy;
      default:
        return null;
    }
  }
}
