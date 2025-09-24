import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';

void main() {
  group("WeatherConditionModel", () {
    final mockJson = {
      "text": "Sunny",
      "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
      "code": 1000
    };

    test("fromJson should return a valid WeatherConditionModel object", () {
      final result = WeatherConditionModel.fromJson(mockJson);

      expect(result, isA<WeatherConditionModel>());
      expect(result.text, "Sunny");
      expect(result.icon, "//cdn.weatherapi.com/weather/64x64/day/113.png");
      expect(result.code, 1000);
    });

    test("toJson should return a valid JSON map", () {
      final model = WeatherConditionModel.fromJson(mockJson);

      final result = model.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result["text"], "Sunny");
      expect(result["icon"], "//cdn.weatherapi.com/weather/64x64/day/113.png");
      expect(result["code"], 1000);
    });

    test("fromJson and toJson should be consistent", () {
      final model = WeatherConditionModel.fromJson(mockJson);
      final jsonBack = model.toJson();

      expect(jsonBack, equals(mockJson));
    });
  });
}
