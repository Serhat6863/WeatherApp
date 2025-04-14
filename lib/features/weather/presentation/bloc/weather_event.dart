import 'package:equatable/equatable.dart';
abstract class WeatherEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent{
  final String cityName;

  FetchWeatherEvent({required this.cityName});

  @override
  List<Object> get props => [cityName];
}