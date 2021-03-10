import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'package:flutter_weather_app/app/data/models/forecast_weather.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/repositories/i_weather_repository.dart';
import 'package:flutter_weather_app/app/presentation/bloc/app_theme/app_theme_bloc.dart';
import 'package:flutter_weather_app/app/presentation/theme/app_theme.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IWeatherRepository _repository;
  final AppThemeBloc _appThemeBloc;

  HomePageBloc(this._repository, this._appThemeBloc) : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is GetWeatherByCityName)
      yield await _getWeatherByCityName(event.city);
    if (event is GetWeatherFromInputValue)
      _getWeatherFromInputValue(event.city);
    if (event is ChangeForecastDate)
      yield _changeForecastDate(event, (state as HomePageLoaded));
  }

  Future<HomePageState> _getWeatherByCityName(String city) async {
    final weather = await this._repository.getWeatherByCityName(city);
    if (weather == null) return HomePageError('Couldn\'t load information');
    this._appThemeBloc.add(
        ChangeTheme(weather.isDay ? AppThemeMode.Day : AppThemeMode.Night));

    return HomePageLoaded(
      weather: weather,
      forecastDates: _getForecastDates(weather),
      forecasts: _getForecastByDay(
        weather,
        weather.forecasts?.last.time ?? DateTime.now(),
      ),
    );
  }

  List<DateTime> _getForecastDates(Weather weather) {
    final List<DateTime> forecastDates = [];
    final List<int> addedValues = [];

    weather.forecasts?.forEach((item) {
      if (!addedValues.contains(item.time.day)) {
        forecastDates.add(item.time);
        addedValues.add(item.time.day);
      }
    });

    return forecastDates.reversed.toList();
  }

  void _getWeatherFromInputValue(String city) {
    if (city.isEmpty) return null;
    return this.add(GetWeatherByCityName(city));
  }

  HomePageLoaded _changeForecastDate(ChangeForecastDate e, HomePageLoaded s) {
    return HomePageLoaded(
      weather: s.weather,
      forecastDates: s.forecastDates,
      forecasts: _getForecastByDay(s.weather, s.forecastDates[e.index]),
      selectedDate: e.index,
    );
  }

  List<ForecastWeather> _getForecastByDay(Weather weather, DateTime time) {
    final List<ForecastWeather> forecastDates = [];

    weather.forecasts?.forEach((item) {
      if (item.time.day == time.day) forecastDates.add(item);
    });

    return forecastDates.reversed.toList();
  }
}
