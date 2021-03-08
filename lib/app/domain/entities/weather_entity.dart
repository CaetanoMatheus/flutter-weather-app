import 'package:flutter_weather_app/app/domain/entities/forecast_weather_entity.dart';
import 'package:flutter_weather_app/app/domain/entities/location_entity.dart';

class WeatherEntity {
  late double _temperature;
  late String _condition;
  late double _windSpeed;
  late int _airHumidity;
  late bool _isDay;
  late String? _image;
  late LocationEntity _location;
  late List<ForecastWeatherEntity> _forecasts;

  WeatherEntity(
    double temperature,
    String condition,
    double windSpeed,
    int airHumidity,
    String? image,
    LocationEntity location, [
    List<ForecastWeatherEntity> forecasts = const [],
    bool isDay = true,
  ]) {
    this.temperature = temperature;
    this.condition = condition;
    this.windSpeed = windSpeed;
    this.airHumidity = airHumidity;
    this.image = image;
    this.isDay = isDay;
    this.forecasts = forecasts;
    this.location = location;
  }

  void addForecast(ForecastWeatherEntity forecast) {
    if (!this._forecasts.contains(forecast))
      this.forecasts = [forecast]..addAll(this._forecasts);
    else
      this._forecasts = [forecast];
  }

  double get temperature => this._temperature;
  String get condition => this._condition;
  double get windSpeed => this._windSpeed;
  int get airHumidity => this._airHumidity;
  String? get image => this._image;
  bool get isDay => this._isDay;
  LocationEntity get location => this._location;
  List<ForecastWeatherEntity> get forecasts => this._forecasts;

  set temperature(double temperature) => this._temperature = temperature;
  set condition(String condition) => this._condition = condition;
  set windSpeed(double windSpeed) => this._windSpeed = windSpeed;
  set airHumidity(int airHumidity) => this._airHumidity = airHumidity;
  set image(String? image) => this._image = image;
  set isDay(bool isDay) => this._isDay = isDay;
  set forecasts(List<ForecastWeatherEntity> forecasts) {
    this._forecasts = forecasts;
    this._forecasts.forEach((ForecastWeatherEntity forecast) {
      if (forecast.weather != this) forecast.weather = this;
    });
  }

  set location(LocationEntity location) {
    this._location = location;
    if (this._location.weather != this) this._location.weather = this;
  }
}
