import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/error/error.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loaded/loaded.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loading/loading.dart';
import 'package:flutter_weather_app/injection_container.dart' as ic;

class HomePage extends StatelessWidget {
  final bloc = ic.get<HomePageBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: (bloc as HomePageBloc)..add(GetWeatherByCityName('goiania')),
      builder: (_, state) {
        if (state is HomePageError) return HomeErrorScreen();
        return state is HomePageLoaded
            ? HomeLoadedScreen(state: state)
            : HomeLoadingScreen();
      },
    );
  }
}
