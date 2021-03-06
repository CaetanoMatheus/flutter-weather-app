import 'package:flutter_weather_app/app/data/models/weather.dart';

abstract class IWeatherRepository {
  Future<Weather?> getWeatherByCityName(String city);
}
