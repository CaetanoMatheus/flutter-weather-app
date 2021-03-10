import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/presentation/pages/error/error_page.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loaded/loaded.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loading/loading.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/styles.dart';
import 'package:flutter_weather_app/injection_container.dart' as ic;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageStyles {
  final bloc = ic.get<HomePageBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetWeatherByCityName('praga'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: screenBackground(context),
      child: BlocBuilder(
        bloc: (bloc as HomePageBloc),
        builder: (_, state) {
          if (state is HomePageError) return ErrorPage();
          return state is HomePageLoaded
              ? HomeLoadedScreen(state: state, bloc: bloc)
              : HomeLoadingScreen();
        },
      ),
    );
  }
}
