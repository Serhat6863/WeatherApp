import 'package:weather_app/features/weather/domain/entities/weahter_condition.dart';

class WeatherConditionModel extends WeatherCondition{

  WeatherConditionModel({
    required String text,
    required String icon,
    required int code,

  }) : super(
    text: text,
    icon: icon,
    code: code,
  );


  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}