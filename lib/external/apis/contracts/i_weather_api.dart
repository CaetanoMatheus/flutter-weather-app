abstract class IWeatherApi {
  Future<Map<String, dynamic>>? getWeather([
    Map<String, dynamic>? filters,
  ]);
}
