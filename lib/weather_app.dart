import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_weather_app/app/presentation/bloc/app_theme/app_theme_bloc.dart';
import 'package:flutter_weather_app/router/routes.dart' as routes;
import 'package:flutter_weather_app/injection_container.dart' as ic;

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: (ic.get<AppThemeBloc>() as AppThemeBloc),
      builder: (_, AppThemeState state) => VRouter(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: state.themeData,
        routes: routes.routes,
      ),
    );
  }
}
