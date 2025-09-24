import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_data_model.dart';

void main() {
  group("WeatherDataModel", () {
    final mockJson = {
      "location": {
        "name": "Clermont-Ferrand",
        "region": "Auvergne",
        "country": "France",
        "lat": 45.7772,
        "lon": 3.087,
        "tz_id": "Europe/Paris",
        "localtime_epoch": 1633017600,
        "localtime": "2021-09-30 12:00"
      },
      "current": {
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
      }
    };

    test("fromJson should return a valid WeatherDataModel object", () {
      final result = WeatherDataModel.fromJson(mockJson);

      expect(result, isA<WeatherDataModel>());
      expect(result.location, isA<LocationModel>());
      expect(result.current, isA<CurrentWeatherModel>());
      expect(result.current.condition, isA<WeatherConditionModel>());

      expect(result.location.name, "Clermont-Ferrand");
      expect(result.current.tempC, 15.0);
      expect(result.current.condition.text, "Sunny");
    });

    test("toJson should return a valid JSON map", () {
      final model = WeatherDataModel.fromJson(mockJson);

      final result = model.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result["location"]["name"], "Clermont-Ferrand");
      expect(result["current"]["temp_c"], 15.0);
      expect(result["current"]["condition"]["code"], 1000);
    });

    test("fromJson and toJson should be consistent", () {
      final model = WeatherDataModel.fromJson(mockJson);
      final jsonBack = model.toJson();

      expect(jsonBack, equals(mockJson));
    });
  });
}
