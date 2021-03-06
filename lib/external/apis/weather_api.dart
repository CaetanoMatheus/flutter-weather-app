import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_weather_app/external/apis/contracts/i_api.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_weather_api.dart';

class WeatherApi implements IWeatherApi {
  final IApi _api;
  final _baseUrl = 'api.weatherapi.com';

  WeatherApi(this._api);

  @override
  Future<Map<String, dynamic>>? getWeather([
    Map<String, dynamic>? filters,
  ]) async {
    final response = await this._api.httpsGet(
          this._baseUrl,
          '/v1/forecast.json',
          this._getQueryParameters(filters),
        );

    return json.decode(response['data']);
  }

  Map<String, dynamic> _getQueryParameters(Map<String, dynamic>? params) {
    return {'key': env['WEATHER_API_KEY']}..addAll(params ?? {});
  }
}
