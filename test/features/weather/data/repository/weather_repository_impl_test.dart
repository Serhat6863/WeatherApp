import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';

import 'package:weather_app/features/weather/data/api/weather_api_service.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_data_model.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/entities/weather_data.dart';

class MockWeatherApiService extends Mock implements WeatherApiService {}

void main() {
  late MockWeatherApiService mockWeatherApiService;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  const city = "Paris";

  setUp(() {
    mockWeatherApiService = MockWeatherApiService();
    weatherRepositoryImpl = WeatherRepositoryImpl(weatherApiService: mockWeatherApiService);
  });

  group("WeatherRepositoryImpl", () {
    test("getCurrentWeather retourne WeatherData en cas de succès", () async {
      // Arrange
      final fakeWeatherDataModel = WeatherDataModel(
        location: LocationModel(
          name: "Paris",
          region: "Ile de France",
          country: "France",
          lat: 48.8566,
          lon: 2.3522,
          tzId: "Europe/Paris",
          localtimeEpoch: 1672531199,
          localtime: "2024-01-01 12:00",
        ),
        current: CurrentWeatherModel(
          tempC: 15.0,
          tempF: 59.0,
          isDay: 1,
          condition: WeatherConditionModel(
            text: "Sunny",
            icon: "//cdn.weatherapi.com/weather/64x64/day/113.png",
            code: 1000,
          ),
          windMph: 5.0,
          windKph: 8.0,
          windDegree: 90,
          windDir: "E",
          pressureMb: 1015.0,
          precipMm: 0.0,
          humidity: 50,
          cloud: 0,
        ),
      );

      final fakeResponse = HttpResponse(
        fakeWeatherDataModel,
        Response(requestOptions: RequestOptions(path: ''), statusCode: 200),
      );

      when(() => mockWeatherApiService.getCurrentWeather(any(), any(), any()))
          .thenAnswer((_) async => fakeResponse);

      // Act
      final result = await weatherRepositoryImpl.getCurrentWeather(city);

      // Assert
      expect(result, isA<WeatherData>());
      expect(result.location.name, equals("Paris"));
      expect(result.current.tempC, equals(15.0));

      verify(() => mockWeatherApiService.getCurrentWeather(any(), any(), any())).called(1);
    });

    test("getCurrentWeather lance une exception si statusCode != 200", () async {
      // Arrange
      final fakeWeatherDataModel = WeatherDataModel(
        location: LocationModel(
          name: "Paris",
          region: "Ile de France",
          country: "France",
          lat: 48.8566,
          lon: 2.3522,
          tzId: "Europe/Paris",
          localtimeEpoch: 1672531199,
          localtime: "2024-01-01 12:00",
        ),
        current: CurrentWeatherModel(
          tempC: 15.0,
          tempF: 59.0,
          isDay: 1,
          condition: WeatherConditionModel(
            text: "Sunny",
            icon: "//cdn.weatherapi.com/weather/64x64/day/113.png",
            code: 1000,
          ),
          windMph: 5.0,
          windKph: 8.0,
          windDegree: 90,
          windDir: "E",
          pressureMb: 1015.0,
          precipMm: 0.0,
          humidity: 50,
          cloud: 0,
        ),
      );

      final fakeResponse = HttpResponse(
        fakeWeatherDataModel,
        Response(requestOptions: RequestOptions(path: ''), statusCode: 500),
      );

      when(() => mockWeatherApiService.getCurrentWeather(any(), any(), any()))
          .thenAnswer((_) async => fakeResponse);

      // Act & Assert
      expect(() => weatherRepositoryImpl.getCurrentWeather(city), throwsA(isA<Exception>()));
      verify(() => mockWeatherApiService.getCurrentWeather(any(), any(), any())).called(1);
    });

    test("searchLocation retourne une liste de Location en cas de succès", () async {
      // Arrange
      final fakeLocations = [
        LocationModel(
          name: "Paris",
          region: "Ile de France",
          country: "France",
          lat: 48.8566,
          lon: 2.3522,
          tzId: "Europe/Paris",
          localtimeEpoch: 1672531199,
          localtime: "2024-01-01 12:00",
        ),
        LocationModel(
          name: "Paris",
          region: "Texas",
          country: "USA",
          lat: 33.6609,
          lon: -95.5555,
          tzId: "America/Chicago",
          localtimeEpoch: 1672531199,
          localtime: "2024-01-01 05:00",
        ),
      ];

      final fakeResponse = HttpResponse(
        fakeLocations,
        Response(requestOptions: RequestOptions(path: ''), statusCode: 200),
      );

      when(() => mockWeatherApiService.searchLocation(any(), any()))
          .thenAnswer((_) async => fakeResponse);

      // Act
      final result = await weatherRepositoryImpl.searchLocation(city);

      // Assert
      expect(result.length, 2);
      expect(result.first.name, equals("Paris"));
      expect(result.last.region, equals("Texas"));
      verify(() => mockWeatherApiService.searchLocation(any(), any())).called(1);
    });

    test("searchLocation lance une exception si statusCode != 200", () async {
      // Arrange
      final fakeResponse = HttpResponse<List<LocationModel>>(
        [],
        Response(requestOptions: RequestOptions(path: ''), statusCode: 500),
      );

      when(() => mockWeatherApiService.searchLocation(any(), any()))
          .thenAnswer((_) async => fakeResponse);

      // Act & Assert
      expect(() => weatherRepositoryImpl.searchLocation(city), throwsA(isA<Exception>()));
      verify(() => mockWeatherApiService.searchLocation(any(), any())).called(1);
    });
  });
}
