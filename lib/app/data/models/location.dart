import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/entities/location_entity.dart';

class Location extends LocationEntity {
  Location(
    String name,
    double latitude,
    double longitude, [
    Weather? weather,
  ]) : super(name, latitude, longitude, weather);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      json['name'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }

  @override
  Weather? get weather {
    return super.weather != null ? (super.weather as Weather) : null;
  }
}
