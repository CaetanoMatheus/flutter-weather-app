import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/entities/forecast_weather_entity.dart';

class ForecastWeather extends ForecastWeatherEntity {
  ForecastWeather(
    double temperature,
    DateTime time,
    Weather? weather, [
    bool isDay = true,
  ]) : super(temperature, time, weather, isDay);

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      (json['temperature'] as num).toDouble(),
      DateTime.parse(json['time'] as String),
      null,
      json['isDay'] as bool,
    );
  }

  Map<String, dynamic> _$ForecastWeatherToJson(ForecastWeather instance) =>
      <String, dynamic>{
        'temperature': instance.temperature,
        'time': instance.time.toIso8601String(),
        'isDay': instance.isDay,
      };

  Map<String, dynamic> toJson() => _$ForecastWeatherToJson(this);

  @override
  Weather? get weather => (super.weather as Weather);
}
