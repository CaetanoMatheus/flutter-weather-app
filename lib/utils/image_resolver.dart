abstract class ImageResolver {
  static const String iconsPath = 'assets/images/images';
  static const String iconsExtension = 'png';

  static const String airHumidity = '$iconsPath/air-humidity.$iconsExtension';
  static const String wind = '$iconsPath/wind-speed.$iconsExtension';

  static const String dayCloudy = '$iconsPath/day-cloudy.$iconsExtension';
  static const String dayRain = '$iconsPath/day-rain.$iconsExtension';
  static const String day = '$iconsPath/day.$iconsExtension';

  static const String nightCloudy = '$iconsPath/night-cloudy.$iconsExtension';
  static const String nightRain = '$iconsPath/night-rain.$iconsExtension';
  static const String night = '$iconsPath/night.$iconsExtension';

  static String? getAssetImageFromWeatherCondition(
    String condition,
    bool isDay,
  ) {
    final c = condition.toLowerCase();
    if (c == 'sunny' || c == 'clear') return isDay ? day : night;
    if (c == 'patchy rain possible' || c == 'mist')
      return isDay ? dayRain : nightRain;
    if (c == 'partly cloudy' || c == 'cloudy' || c == 'overcast')
      return isDay ? dayCloudy : nightCloudy;
  }
}
