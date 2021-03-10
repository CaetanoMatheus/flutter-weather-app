import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/date_resolver.dart';

class AppDateDisplay extends StatelessWidget {
  final DateTime? date;
  final bool bold;
  final void Function()? onTap;

  AppDateDisplay({
    Key? key,
    this.date,
    this.bold = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        DateResolver.parse(date),
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
