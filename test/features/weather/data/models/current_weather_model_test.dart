import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';

void main() {
  group("CurrentWeatherModel", () {
    final mockJson = {
      "temp_c": 15.0,
      "temp_f": 59.0,
      "is_day": 1,
      "condition": {
        "text": "Sunny",
        "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
        "code": 1000
      },
      "wind_mph": 5.0,
      "wind_kph": 8.0,
      "wind_degree": 90,
      "wind_dir": "E",
      "pressure_mb": 1015.0,
      "precip_mm": 0.0,
      "humidity": 50,
      "cloud": 0
    };

    test("fromJson should return a valid CurrentWeatherModel object", () {
      final result = CurrentWeatherModel.fromJson(mockJson);

      expect(result, isA<CurrentWeatherModel>());
      expect(result.tempC, 15.0);
      expect(result.tempF, 59.0);
      expect(result.isDay, 1);
      expect(result.condition, isA<WeatherConditionModel>());
      expect(result.condition.text, "Sunny");
      expect(result.condition.code, 1000);
      expect(result.windDir, "E");
      expect(result.humidity, 50);
      expect(result.cloud, 0);
    });

    test("toJson should return a valid JSON map", () {
      final model = CurrentWeatherModel.fromJson(mockJson);

      final result = model.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result["temp_c"], 15.0);
      expect(result["temp_f"], 59.0);
      expect(result["is_day"], 1);
      expect(result["condition"], isA<Map<String, dynamic>>());
      expect(result["condition"]["text"], "Sunny");
      expect(result["condition"]["icon"], "//cdn.weatherapi.com/weather/64x64/day/113.png");
      expect(result["condition"]["code"], 1000);
      expect(result["wind_dir"], "E");
      expect(result["humidity"], 50);
    });

    test("fromJson and toJson should be consistent", () {
      final model = CurrentWeatherModel.fromJson(mockJson);
      final jsonBack = model.toJson();

      expect(jsonBack, equals(mockJson));
    });
  });
}
