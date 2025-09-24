import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

class WeatherData extends Equatable{
  final Location location;
  final CurrentWeather current;

  const WeatherData({
    required this.location,
    required this.current,
  });

  @override
  List<Object?> get props => [location, current];
}