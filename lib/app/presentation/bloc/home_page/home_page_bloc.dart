import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/repositories/i_weather_repository.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IWeatherRepository _repository;

  HomePageBloc(this._repository) : super(HomePageInitial());

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
    return weather == null
        ? HomePageError('Couldn\'t load weather information')
        : HomePageLoaded(weather);
  }
}
