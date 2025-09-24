import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';

void main() {
  group("LocationModel", () {
    final mockJson = {
      "name": "Clermont-Ferrand",
      "region": "Auvergne",
      "country": "France",
      "lat": 45.7772,
      "lon": 3.087,
      "tz_id": "Europe/Paris",
      "localtime_epoch": 1633017600,
      "localtime": "2021-09-30 12:00"
    };

    test("fromJson should return a valid LocationModel object", () {
      final result = LocationModel.fromJson(mockJson);

      expect(result, isA<LocationModel>());
      expect(result.name, "Clermont-Ferrand");
      expect(result.region, "Auvergne");
      expect(result.country, "France");
      expect(result.lat, 45.7772);
      expect(result.lon, 3.087);
      expect(result.tzId, "Europe/Paris");
      expect(result.localtimeEpoch, 1633017600);
      expect(result.localtime, "2021-09-30 12:00");
    });

    test("toJson should return a valid JSON map", () {
      final model = LocationModel.fromJson(mockJson);

      final result = model.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result["name"], "Clermont-Ferrand");
      expect(result["region"], "Auvergne");
      expect(result["country"], "France");
      expect(result["lat"], 45.7772);
      expect(result["lon"], 3.087);
      expect(result["tz_id"], "Europe/Paris");
      expect(result["localtime_epoch"], 1633017600);
      expect(result["localtime"], "2021-09-30 12:00");
    });

    test("fromJson and toJson should be consistent", () {
      final model = LocationModel.fromJson(mockJson);
      final jsonBack = model.toJson();

      expect(jsonBack, equals(mockJson));
    });

    test("fromJson should handle missing fields with defaults", () {
      final result = LocationModel.fromJson({});

      expect(result.name, '');
      expect(result.region, '');
      expect(result.country, '');
      expect(result.lat, 0.0);
      expect(result.lon, 0.0);
      expect(result.tzId, '');
      expect(result.localtimeEpoch, 0);
      expect(result.localtime, '');
    });
  });
}
