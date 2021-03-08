import 'package:flutter/material.dart';

mixin HomeLoadedScreenStyles {
  TextStyle temperatureStyle(BuildContext context) {
    return TextStyle(
      fontSize: 74,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyText1?.color,
    );
  }
}
