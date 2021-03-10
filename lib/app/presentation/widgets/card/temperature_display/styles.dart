import 'package:flutter/material.dart';

mixin TemperatureDisplayStyles {
  TextStyle temperatureStyle(BuildContext context, double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyText1?.color,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 5,
          offset: Offset(1, 1),
        )
      ],
    );
  }
}
