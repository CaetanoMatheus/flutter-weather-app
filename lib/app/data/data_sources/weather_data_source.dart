import 'package:flutter_weather_app/app/data/data_sources/contracts/i_weather_data_source.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_weather_api.dart';
import 'package:flutter_weather_app/utils/image_resolver.dart';

class WeatherDataSource implements IWeatherDataSource {
  final IWeatherApi _api;

  WeatherDataSource(this._api);

  @override
  Future<Weather?> getWeatherByCityName(String city) async {
    final data = await this._api.getWeather({'q': city});
    final weatherData = _handleWeatherFields(data);
    return weatherData != null ? Weather.fromJson(weatherData) : null;
  }

  Map<String, dynamic>? _handleWeatherFields(Map<String, dynamic>? map) {
    if (map == null || map['current'] == null || map['location'] == null)
      return null;

    final weather = map['current'];
    final location = map['location'];

    return {
      'temperature': weather['temp_c'],
      'condition': weather['condition']['text'],
      'windSpeed': weather['wind_kph'],
      'airHumidity': weather['humidity'],
      'image': ImageResolver.getAssetImageFromWeatherCondition(
        weather['condition']['text'],
        weather['is_day'] == 1,
      ),
      'isDay': weather['is_day'] == 1,
      'location': {
        'name': location['name'],
        'latitude': location['lat'],
        'longitude': location['lon'],
      }
    };
  }
}
