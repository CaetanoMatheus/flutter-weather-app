import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/theme/app_theme.dart';

mixin CenterIconCardStyles {
  BoxDecoration containerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Colors.white.withOpacity(.3),
      borderRadius: BorderRadius.all(Radius.circular(AppTheme.radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.black54.withOpacity(.2),
          blurRadius: 5,
          offset: Offset(2, 2),
        ),
        BoxShadow(color: Theme.of(context).primaryColor)
      ],
    );
  }

  EdgeInsets containerPadding() => EdgeInsets.symmetric(vertical: 15);

  TextStyle subTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyText1?.color,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }
}
