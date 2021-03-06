import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_weather_app/router/routes.dart' as routes;

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      routes: routes.routes,
    );
  }
}
