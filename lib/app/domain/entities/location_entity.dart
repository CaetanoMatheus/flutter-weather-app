import 'package:flutter_weather_app/app/domain/entities/weather_entity.dart';

class LocationEntity {
  late String _name;
  late double _latitude;
  late double _longitude;
  WeatherEntity? _weather;

  LocationEntity(
    String name,
    double latitude,
    double longitude, [
    WeatherEntity? weather,
  ]) {
    this.name = name;
    this.latitude = latitude;
    this.longitude = longitude;
    this.weather = weather;
  }

  String get name => this._name;
  double get latitude => this._latitude;
  double get longitude => this._longitude;
  WeatherEntity? get weather => this._weather;

  set name(String name) => this._name = name;
  set latitude(double latitude) => this._latitude = latitude;
  set longitude(double longitude) => this._longitude = longitude;
  set weather(WeatherEntity? weather) {
    this._weather = weather;
    if (this._weather?.location != this) this._weather?.location = this;
  }
}
