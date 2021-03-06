import 'package:flutter_weather_app/app/domain/entities/weather_entity.dart';

class LocationEntity {
  late String _name;
  late double _latitude;
  late double _longitude;
  WeatherEntity? _wheater;

  LocationEntity(
    String name,
    double latitude,
    double longitude, [
    WeatherEntity? wheater,
  ]) {
    this.name = name;
    this.latitude = latitude;
    this.longitude = longitude;
    this.wheater = wheater;
  }

  String get name => this._name;
  double get latitude => this._latitude;
  double get longitude => this._longitude;
  WeatherEntity? get wheater => this._wheater;

  set name(String name) => this._name = name;
  set latitude(double latitude) => this._latitude = latitude;
  set longitude(double longitude) => this._longitude = longitude;
  set wheater(WeatherEntity? wheater) {
    this._wheater = wheater;
    if (this._wheater?.location != this) this._wheater?.location = this;
  }
}
