import 'package:flutter_weather_app/app/data/models/forecast_weather.dart';
import 'package:flutter_weather_app/app/data/models/location.dart';
import 'package:flutter_weather_app/app/domain/entities/weather_entity.dart';

class Weather extends WeatherEntity {
  Weather(
    double temperature,
    String condition,
    double windSpeed,
    int airHumidity,
    String? image,
    List<ForecastWeather>? forecasts,
    Location? location, [
    bool isDay = true,
  ]) : super(
          temperature,
          condition,
          windSpeed,
          airHumidity,
          image,
          forecasts,
          location,
          isDay,
        );

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      (json['temperature'] as num).toDouble(),
      json['condition'] as String,
      (json['windSpeed'] as num).toDouble(),
      json['airHumidity'] as int,
      json['image'] as String?,
      null,
      null,
      json['isDay'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': this.temperature,
      'condition': this.condition,
      'windSpeed': this.windSpeed,
      'airHumidity': this.airHumidity,
      'image': this.image,
      'isDay': this.isDay,
    };
  }

  @override
  Location? get location => (super.location as Location);

  @override
  List<ForecastWeather>? get forecasts {
    return super.forecasts?.map((e) => e as ForecastWeather).toList();
  }
}
