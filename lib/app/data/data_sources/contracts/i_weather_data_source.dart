import 'package:flutter_weather_app/app/data/data_sources/contracts/i_data_source.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';

abstract class IWeatherDataSource extends IDataSource {
  Future<Weather?> getWeatherByCityName(String city);
}
