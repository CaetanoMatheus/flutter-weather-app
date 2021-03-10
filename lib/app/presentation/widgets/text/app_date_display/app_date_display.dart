import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/date_resolver.dart';

class AppDateDisplay extends StatelessWidget {
  final DateTime? date;
  final bool selected;
  final void Function()? onTap;

  AppDateDisplay({
    Key? key,
    this.date,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        DateResolver.parse(date),
        style: TextStyle(
          color: selected ? null : Colors.grey.shade700.withOpacity(.7),
          fontSize: 16,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
