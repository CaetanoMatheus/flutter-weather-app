// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    (json['temperature'] as num).toDouble(),
    json['condition'] as String,
    (json['windSpeed'] as num).toDouble(),
    json['airHumidity'] as int,
    json['image'] as String?,
    Location.fromJson(json['location'] as Map<String, dynamic>),
    (json['forecasts'] as List<dynamic>)
        .map((e) => ForecastWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['isDay'] as bool,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temperature': instance.temperature,
      'condition': instance.condition,
      'windSpeed': instance.windSpeed,
      'airHumidity': instance.airHumidity,
      'image': instance.image,
      'isDay': instance.isDay,
      'location': instance.location,
      'forecasts': instance.forecasts,
    };
