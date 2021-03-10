import 'package:flutter_weather_app/app/domain/entities/weather_entity.dart';

class ForecastWeatherEntity {
  late double _temperature;
  late DateTime _time;
  late bool _isDay;
  late String? _image;
  late WeatherEntity? _weather;

  ForecastWeatherEntity(
    double temperature,
    DateTime time,
    String? image,
    WeatherEntity? weather, [
    bool isDay = true,
  ]) {
    this.temperature = temperature;
    this.time = time;
    this.image = image;
    this.isDay = isDay;
    this.weather = weather;
  }

  double get temperature => this._temperature;
  DateTime get time => this._time;
  String? get image => this._image;
  bool get isDay => this._isDay;
  WeatherEntity? get weather => this._weather;

  set temperature(double temperature) => this._temperature = temperature;
  set time(DateTime time) => this._time = time;
  set image(String? image) => this._image = image;
  set isDay(bool isDay) => this._isDay = isDay;
  set weather(WeatherEntity? weather) {
    this._weather = weather;
    this._weather?.addForecast(this);
  }
}
