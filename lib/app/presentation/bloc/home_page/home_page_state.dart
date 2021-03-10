part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final Weather weather;
  final List<DateTime> forecastDates;
  final List<ForecastWeather> forecasts;

  HomePageLoaded(this.weather, this.forecastDates, this.forecasts);
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError(this.message);
}
