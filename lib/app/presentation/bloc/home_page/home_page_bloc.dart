import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/repositories/i_weather_repository.dart';
import 'package:flutter_weather_app/app/presentation/bloc/app_theme/app_theme_bloc.dart';
import 'package:flutter_weather_app/app/presentation/theme/app_theme.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IWeatherRepository _repository;
  final AppThemeBloc _appThemeBloc;

  HomePageBloc(this._repository, this._appThemeBloc) : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is GetWeatherByCityName) yield await _getWeatherByCityName(event);
  }

  Future<HomePageState> _getWeatherByCityName(
    GetWeatherByCityName event,
  ) async {
    final weather = await this._repository.getWeatherByCityName(event.city);
    if (weather == null)
      return HomePageError('Couldn\'t load weather information');
    this._appThemeBloc.add(ChangeTheme(
          weather.isDay ? AppThemeMode.Day : AppThemeMode.Night,
        ));
    return HomePageLoaded(weather);
  }
}
