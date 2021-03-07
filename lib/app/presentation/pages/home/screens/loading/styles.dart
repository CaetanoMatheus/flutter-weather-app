import 'package:flutter/material.dart';
import 'package:flutter_weather_app/consts/app_theme.dart';

mixin HomeLoadingScreenStyles {
  BoxDecoration screenBackground() {
    return BoxDecoration(gradient: AppTheme.gradient);
  }

  BoxDecoration containersDecoration() {
    return BoxDecoration(
      color: AppTheme.shimmer,
      borderRadius: BorderRadius.all(Radius.circular(AppTheme.radius)),
    );
  }

  EdgeInsets temperatureItemsDefaultMargin() => EdgeInsets.only(bottom: 20);
  EdgeInsets conditionImageMargin() => EdgeInsets.symmetric(vertical: 20);
  EdgeInsets forecastItemsMargin() => EdgeInsets.symmetric(horizontal: 20);
}
