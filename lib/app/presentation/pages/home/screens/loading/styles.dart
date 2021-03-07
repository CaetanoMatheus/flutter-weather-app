import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/theme/app_theme.dart';

mixin HomeLoadingScreenStyles {
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
