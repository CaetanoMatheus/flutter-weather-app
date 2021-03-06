import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotEnv;

import 'package:flutter_weather_app/weather_app.dart';
import 'package:flutter_weather_app/injection_container.dart' as ic;

Future<void> main() async {
  await dotEnv.load();
  await ic.initDepencies();
  runApp(WeatherApp());
}
