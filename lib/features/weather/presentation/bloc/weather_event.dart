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

class FetchSuggestionsEvent extends WeatherEvent{
  final String query;

  FetchSuggestionsEvent({required this.query});

  @override
  List<Object> get props => [query];
}


