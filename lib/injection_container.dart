import 'package:get_it/get_it.dart';

import 'package:flutter_weather_app/app/presentation/bloc/app_theme/app_theme_bloc.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/data/data_sources/contracts/i_weather_data_source.dart';
import 'package:flutter_weather_app/app/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather_app/app/data/repositories/weather_repository.dart';
import 'package:flutter_weather_app/app/domain/repositories/i_weather_repository.dart';
import 'package:flutter_weather_app/external/apis/api.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_api.dart';
import 'package:flutter_weather_app/external/apis/contracts/i_weather_api.dart';
import 'package:flutter_weather_app/external/apis/weather_api.dart';

final GetIt _getIt = GetIt.instance;

get<T extends Object>() => _getIt<T>();

Future<void> initDepencies() async {
  //! External - Apis
  _getIt.registerLazySingleton<IApi>(() => Api());
  _getIt.registerLazySingleton<IWeatherApi>(() => WeatherApi(_getIt()));

  //! Data - Data Sources
  _getIt.registerLazySingleton<IWeatherDataSource>(
    () => WeatherDataSource(_getIt()),
  );

  //! Data - Repositories
  _getIt.registerLazySingleton<IWeatherRepository>(
    () => WeatherRepository(_getIt()),
  );

  //! Presentation - Controllers
  _getIt.registerSingleton<AppThemeBloc>(AppThemeBloc());
  _getIt.registerFactory<HomePageBloc>(() => HomePageBloc(_getIt(), _getIt()));
}
