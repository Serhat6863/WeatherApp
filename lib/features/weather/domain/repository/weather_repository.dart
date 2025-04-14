import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData> getCurrentWeather(String city);
}