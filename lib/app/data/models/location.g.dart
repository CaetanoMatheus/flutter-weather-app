// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['name'] as String,
    (json['latitude'] as num).toDouble(),
    (json['longitude'] as num).toDouble(),
    json['weather'] == null
        ? null
        : Weather.fromJson(json['weather'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'weather': instance.weather,
    };
