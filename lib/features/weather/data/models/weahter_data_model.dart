import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

import 'current_weather_model.dart';

class WeatherDataModel extends WeatherData{

  final LocationModel location;
  final CurrentWeatherModel current;

  WeatherDataModel({
    required this.location,
    required this.current,
  }) : super(
    location: location,
    current: current,
  );

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      location: LocationModel.fromJson(json['location']),
      current: CurrentWeatherModel.fromJson(json['current']),
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'location': location.toJson(),
      'current': current.toJson(),
    };
  }
}