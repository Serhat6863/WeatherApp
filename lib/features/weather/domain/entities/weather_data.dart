import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

class WeatherData{
  final Location location;
  final CurrentWeather current;

  const WeatherData({
    required this.location,
    required this.current,
  });
}