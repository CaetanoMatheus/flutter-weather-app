import 'package:flutter_weather_app/app/data/data_sources/contracts/i_weather_data_source.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_weather_api.dart';

class WeatherDataSource implements IWeatherDataSource {
  final IWeatherApi _api;

  WeatherDataSource(this._api);

  @override
  Future<Weather?> getWeatherByCityName(String city) async {
    final data = await this._api.getWeather();
    return data != null ? Weather.fromJson(data) : null;
  }
}
