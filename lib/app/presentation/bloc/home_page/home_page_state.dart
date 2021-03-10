part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {
  HomePageState copyWith();
}

class HomePageInitial extends HomePageState {
  HomePageInitial copyWith() => HomePageInitial();
}

class HomePageLoading extends HomePageState {
  HomePageLoading copyWith() => HomePageLoading();
}

class HomePageLoaded extends HomePageState {
  final Weather weather;
  final int selectedDate;
  final bool cityNotFound;
  final List<DateTime> forecastDates;
  final List<ForecastWeather> forecasts;

  HomePageLoaded({
    required this.weather,
    required this.forecastDates,
    required this.forecasts,
    this.selectedDate = 0,
    this.cityNotFound = false,
  });

  @override
  HomePageLoaded copyWith({
    Weather? weather,
    List<ForecastWeather>? forecasts,
    List<DateTime>? forecastDates,
    int? selectedDate,
    bool? cityNotFound,
  }) {
    return HomePageLoaded(
      weather: weather ?? this.weather,
      forecastDates: forecastDates ?? this.forecastDates,
      forecasts: forecasts ?? this.forecasts,
      selectedDate: selectedDate ?? this.selectedDate,
      cityNotFound: cityNotFound ?? this.cityNotFound,
    );
  }
}

class HomePageError extends HomePageState {
  final String? message;

  HomePageError([this.message]);

  HomePageError copyWith() => HomePageError();
}
