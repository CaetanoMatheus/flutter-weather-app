import 'package:flutter_weather_app/app/data/data_sources/contracts/i_weather_data_source.dart';
import 'package:flutter_weather_app/app/data/models/forecast_weather.dart';
import 'package:flutter_weather_app/app/data/models/location.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_weather_api.dart';
import 'package:flutter_weather_app/utils/image_resolver.dart';

class WeatherDataSource implements IWeatherDataSource {
  final IWeatherApi _api;

  WeatherDataSource(this._api);

  @override
  Future<Weather?> getWeatherByCityName(String city) async {
    final data = await this._api.getWeather({'q': city, 'days': '3'});
    final weatherData = _handleWeatherFields(data);
    if (weatherData == null) return null;
    final weather = Weather.fromJson(weatherData);
    _handleLocation(data, weather);
    _handleForecasts(data, weather);
    return weather;
  }

  Map<String, dynamic>? _handleWeatherFields(Map<String, dynamic>? map) {
    return map == null || map['current'] == null || map['location'] == null
        ? null
        : {
            'temperature': map['current']['temp_c'],
            'condition': map['current']['condition']['text'],
            'windSpeed': map['current']['wind_kph'],
            'airHumidity': map['current']['humidity'],
            'isDay': map['current']['is_day'] == 1,
            'image': ImageResolver.getAssetImageFromWeatherCondition(
              map['current']['condition']['text'],
              map['current']['is_day'] == 1,
            ),
          };
  }

  void _handleLocation(
    Map<String, dynamic>? map,
    Weather weather,
  ) {
    if (map != null && map['location'] != null) {
      weather.location = Location.fromJson({
        'name': map['location']['name'],
        'latitude': map['location']['lat'],
        'longitude': map['location']['lon'],
      });
    }
  }

  void _handleForecasts(
    Map<String, dynamic>? map,
    Weather weather,
  ) {
    for (final item in map?['forecast']?['forecastday']) {
      for (var mappedForcast in item['hour']) {
        final forecast = ForecastWeather.fromJson({
          'temperature': mappedForcast['temp_c'],
          'time': mappedForcast['time'],
          'image': mappedForcast['condition']['icon'],
          'isDay': mappedForcast['is_day'] == 1,
        });

        forecast.weather = weather;
      }
    }
  }
}
