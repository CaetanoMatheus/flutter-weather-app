import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/temperature_display/styles.dart';

class TemperatureDisplay extends StatelessWidget with TemperatureDisplayStyles {
  final String text;
  final double fontSize;

  TemperatureDisplay(this.text, {Key? key, this.fontSize = 74})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: temperatureStyle(context, fontSize)),
            Text('°', style: temperatureStyle(context, fontSize)),
          ],
        ),
      ),
    );
  }
}
