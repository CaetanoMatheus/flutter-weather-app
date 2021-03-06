import 'package:flutter_weather_app/app/data/data_sources/contracts/i_weather_data_source.dart';
import 'package:flutter_weather_app/app/data/models/weather.dart';
import 'package:flutter_weather_app/app/domain/repositories/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherDataSource _dataSource;

  WeatherRepository(this._dataSource);

  @override
  Future<Weather?> getWeatherByCityName(String city) {
    return this._dataSource.getWeatherByCityName(city);
  }
}
