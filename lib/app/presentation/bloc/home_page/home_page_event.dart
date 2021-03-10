part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class GetWeatherByCityName extends HomePageEvent {
  final String city;

  GetWeatherByCityName(this.city);
}

class GetWeatherFromInputValue extends HomePageEvent {
  final String city;

  GetWeatherFromInputValue(this.city);
}

class ChangeForecastDate extends HomePageEvent {
  final int index;

  ChangeForecastDate(this.index);
}
