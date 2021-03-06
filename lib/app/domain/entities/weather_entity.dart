import 'package:flutter_weather_app/app/domain/entities/location_entity.dart';

class WeatherEntity {
  late double _temperature;
  late String _condition;
  late double _windSpeed;
  late int _airHumidity;
  late bool _isDay;
  late LocationEntity _location;

  WeatherEntity(
    double temperature,
    String condition,
    double windSpeed,
    int airHumidity,
    LocationEntity location, [
    bool isDay = true,
  ]) {
    this.temperature = temperature;
    this.condition = condition;
    this.windSpeed = windSpeed;
    this.airHumidity = airHumidity;
    this.isDay = isDay;
    this.location = location;
  }

  double get temperature => this._temperature;
  String get condition => this._condition;
  double get windSpeed => this._windSpeed;
  int get airHumidity => this._airHumidity;
  bool get isDay => this._isDay;
  LocationEntity get location => this._location;

  set temperature(double temperature) => this._temperature = temperature;
  set condition(String condition) => this._condition = condition;
  set windSpeed(double windSpeed) => this._windSpeed = windSpeed;
  set airHumidity(int airHumidity) => this._airHumidity = airHumidity;
  set isDay(bool isDay) => this._isDay = isDay;
  set location(LocationEntity location) {
    this._location = location;
    if (this._location.weather != this) this._location.weather = this;
  }
}
