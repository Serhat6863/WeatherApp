import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';

import '../../domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeather {
  @override
  final WeatherConditionModel condition;

   CurrentWeatherModel({
    required double tempC,
    required double tempF,
    required int isDay,
    required this.condition,
    required double windMph,
    required double windKph,
    required int windDegree,
    required String windDir,
    required double pressureMb,
    required double precipMm,
    required int humidity,
    required int cloud,
  }) : super(
         tempC: tempC,
         tempF: tempF,
         isDay: isDay,
         condition: condition,
         windMph: windMph,
         windKph: windKph,
         windDegree: windDegree,
         windDir: windDir,
         pressureMb: pressureMb,
         precipMm: precipMm,
         humidity: humidity,
         cloud: cloud,
       );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      isDay: json['is_day'],
      condition: WeatherConditionModel.fromJson(json['condition']),
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      precipMm: json['precip_mm'],
      humidity: json['humidity'],
      cloud: json['cloud'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'precip_mm': precipMm,
      'humidity': humidity,
      'cloud': cloud,
    };
  }
}
