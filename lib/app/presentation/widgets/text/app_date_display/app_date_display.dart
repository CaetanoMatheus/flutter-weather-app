import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/date_resolver.dart';

class AppDataDisplay extends StatelessWidget {
  final DateTime? date;

  AppDataDisplay({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateResolver.parse(date),
      style: TextStyle(fontSize: 16),
    );
  }
}
