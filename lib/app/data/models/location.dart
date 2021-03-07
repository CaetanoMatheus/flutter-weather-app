import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/entities/location_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends LocationEntity {
  Location(
    String name,
    double latitude,
    double longitude, [
    Weather? weather,
  ]) : super(name, latitude, longitude, weather);

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  Weather? get weather {
    return super.weather != null ? (super.weather as Weather) : null;
  }
}
