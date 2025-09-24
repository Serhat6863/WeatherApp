import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_condition_model.dart';
import 'package:weather_app/features/weather/data/models/weahter_data_model.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_state.dart';

class MockWeatherRepository extends Mock implements WeatherRepositoryImpl {}


void main(){
  group("WeatherBloc", (){


    final mockWeatherRepository = MockWeatherRepository();

    final mockCityName = "London";



    final mockLocation = LocationModel(
      name: "London",
      region: "City of London, Greater London",
      country: "United Kingdom",
      lat: 51.52,
      lon: -0.11,
      tzId: "Europe/London",
      localtimeEpoch: 1696089600,
      localtime: "2023-10-01 12:00",
    );


    final mockCurrentWeather = CurrentWeatherModel(
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
    );


    final mockWeatherData = WeatherDataModel(
      location: mockLocation,
      current: mockCurrentWeather,
    );


    blocTest<WeatherBloc, WeatherState>(
      "handles FetchWeatherEvent and emits loading and loaded states",
      build: () => WeatherBloc(weatherRepository: mockWeatherRepository),
      setUp: (){
        when(() => mockWeatherRepository.getCurrentWeather(mockCityName))
            .thenAnswer((_) async => mockWeatherData);
      },
      act: (bloc) => bloc.add(FetchWeatherEvent(cityName: mockCityName)),
      expect: () => [
        WeatherState.loading(),
        WeatherState.loaded(mockWeatherData),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      "handles FetchWeatherEvent and emits loading and error states when error",
      build: () => WeatherBloc(weatherRepository: mockWeatherRepository),
      setUp: (){
        when(() => mockWeatherRepository.getCurrentWeather(mockCityName))
            .thenThrow(Exception('Failed to fetch weather data'));
      },
      act: (bloc) => bloc.add(FetchWeatherEvent(cityName: mockCityName)),
      expect: () => [
        WeatherState.loading(),
        WeatherState.error('Exception: Failed to fetch weather data'),
      ],
    );


    final mockQuery = "Lon";

    final mockSuggestions = [
      LocationModel(
        name: "London",
        region: "City of London, Greater London",
        country: "United Kingdom",
        lat: 51.52,
        lon: -0.11,
        tzId: "Europe/London",
        localtimeEpoch: 1696089600,
        localtime: "2023-10-01 12:00",
      ),
      LocationModel(
        name: "Long Beach",
        region: "California",
        country: "United States of America",
        lat: 33.77,
        lon: -118.19,
        tzId: "America/Los_Angeles",
        localtimeEpoch: 1696068000,
        localtime: "2023-10-01 04:00",
      ),
    ];

    blocTest<WeatherBloc, WeatherState>(
      "handles FetchSuggestionsEvent and emits loading and suggestions states",
      build: () => WeatherBloc(weatherRepository: mockWeatherRepository),
      setUp: (){
        when(() => mockWeatherRepository.searchLocation(mockQuery))
            .thenAnswer((_) async => mockSuggestions);
      },
      act: (bloc) => bloc.add(FetchSuggestionsEvent(query: mockQuery)),
      expect: () => [
        WeatherState.loading(),
        WeatherState.suggestions(mockSuggestions),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      "handles FetchSuggestionsEvent and emits loading and error states when error",
      build: () => WeatherBloc(weatherRepository: mockWeatherRepository),
      setUp: (){
        when(() => mockWeatherRepository.searchLocation(mockQuery))
            .thenThrow(Exception('Failed to fetch suggestions'));
      },
      act: (bloc) => bloc.add(FetchSuggestionsEvent(query: mockQuery)),
      expect: () => [
        WeatherState.loading(),
        WeatherState.error('Exception: Failed to fetch suggestions'),
      ],
    );



  });
}