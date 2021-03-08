import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/entities/forecast_weather_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_weather.g.dart';

@JsonSerializable()
class ForecastWeather extends ForecastWeatherEntity {
  ForecastWeather(
    double temperature,
    DateTime time,
    Weather weather, [
    bool isDay = true,
  ]) : super(temperature, time, weather, isDay);

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return _$ForecastWeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastWeatherToJson(this);

  @override
  Weather get weather => (super.weather as Weather);
}
