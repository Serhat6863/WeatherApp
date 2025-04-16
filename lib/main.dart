import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/data/api/weather_api_service.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/screen/current_weather_screen.dart';


void main() {
  final dio = Dio();
  final weatherApiService = WeatherApiService(dio);
  final weatherRepository = WeatherRepositoryImpl(weatherApiService: weatherApiService);

  runApp(
    MyApp(
      weatherRepository: weatherRepository,
    )
  );
}

class MyApp extends StatelessWidget {

  final WeatherRepositoryImpl weatherRepository;

  const MyApp({super.key, required this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: CurrentWeatherScreen(),
      ),
    );
  }
}
