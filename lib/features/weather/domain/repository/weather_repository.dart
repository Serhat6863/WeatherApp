import 'package:weather_app/core/resource/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherData>> getCurrentWeather(String city);
}