import 'package:flutter_weather_app/app/data/models/location.dart';
import 'package:flutter_weather_app/app/domain/entities/weather_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auto_genereted/weather.g.dart';

@JsonSerializable()
class Weather extends WeatherEntity {
  Weather(
    double temperature,
    String condition,
    double windSpeed,
    int airHumidity,
    Location location, [
    bool isDay = true,
  ]) : super(temperature, condition, windSpeed, airHumidity, location, isDay);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  Location get location => (super.location as Location);
}
