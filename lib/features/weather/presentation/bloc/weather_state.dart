import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

import '../../domain/entities/location.dart';

enum WeatherStatus{initial, loading, loaded, error}

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isLoaded => this == WeatherStatus.loaded;
  bool get isError => this == WeatherStatus.error;

}


class WeatherState {
  final WeatherStatus status;
  final String message;
  final WeatherData ? weatherData;
  final List<Location> ? suggestions;

  WeatherState({
    required this.status,
    required this.message,
    this.weatherData,
    this.suggestions
  });

  factory WeatherState.initiel() => WeatherState(
    status: WeatherStatus.initial,
    message: '',
  );

  factory WeatherState.loading() => WeatherState(
    status: WeatherStatus.loading,
    message: '',
  );


  factory WeatherState.loaded(WeatherData data) => WeatherState(
    status: WeatherStatus.loaded,
    message: '',
    weatherData: data,
  );

  factory WeatherState.error(String message) => WeatherState(
    status: WeatherStatus.error,
    message: message,
  );


  factory WeatherState.suggestions(List<Location> suggestions) => WeatherState(
    status: WeatherStatus.loaded,
    message: '',
    suggestions: suggestions,
  );



  WeatherState copyWith({
    WeatherStatus? status,
    String? message,
    WeatherData? weatherData,
    List<Location>? suggestions,

  }) {
    return WeatherState(
      status: status ?? this.status,
      message: message ?? this.message,
      weatherData: weatherData ?? this.weatherData,
      suggestions: suggestions ?? this.suggestions,
    );
  }


  @override
  List<Object?> get props => [
    status,
    message,
    weatherData,
    suggestions,
  ];

}