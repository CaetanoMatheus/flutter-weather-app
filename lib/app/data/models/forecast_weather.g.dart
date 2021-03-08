// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeather _$ForecastWeatherFromJson(Map<String, dynamic> json) {
  return ForecastWeather(
    (json['temperature'] as num).toDouble(),
    DateTime.parse(json['time'] as String),
    Weather.fromJson(json['weather'] as Map<String, dynamic>),
    json['isDay'] as bool,
  );
}

Map<String, dynamic> _$ForecastWeatherToJson(ForecastWeather instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'time': instance.time.toIso8601String(),
      'isDay': instance.isDay,
      'weather': instance.weather,
    };
