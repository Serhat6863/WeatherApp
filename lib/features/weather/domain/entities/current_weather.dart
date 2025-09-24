import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weahter_condition.dart';

class CurrentWeather extends Equatable{
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double precipMm;
  final int humidity;
  final int cloud;

  const CurrentWeather({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
  });

  @override
  List<Object?> get props => [
    tempC,
    tempF,
    isDay,
    condition,
    windMph,
    windKph,
    windDegree,
    windDir,
    pressureMb,
    precipMm,
    humidity,
    cloud,
  ];

}