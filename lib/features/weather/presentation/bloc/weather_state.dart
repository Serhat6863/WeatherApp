import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

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

  WeatherState({
    required this.status,
    required this.message,
    this.weatherData,
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

  WeatherState copyWith({
    WeatherStatus? status,
    String? message,
    WeatherData? weatherData,
  }) {
    return WeatherState(
      status: status ?? this.status,
      message: message ?? this.message,
      weatherData: weatherData ?? this.weatherData,

    );
  }


  @override
  List<Object?> get props => [
    status,
    message,
    weatherData,
  ];

}