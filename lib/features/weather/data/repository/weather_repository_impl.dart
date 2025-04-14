import 'package:weather_app/core/constants/cosntants.dart';
import 'package:weather_app/features/weather/data/api/weather_api_service.dart';
import 'package:weather_app/features/weather/domain/entities/weather_data.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{

  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl({
    required this.weatherApiService,
  });

  @override
  Future<WeatherData> getCurrentWeather(String city) async {
    try{
      final response = await weatherApiService.getCurrentWeather(
        apikey,
        city,
        'no',
      );

      if(response.response.statusCode != 200){
        throw Exception("erreur lors de la requete");
      }

      final weatherData = response.data;

      return WeatherData(
        location: weatherData.location,
        current: weatherData.current,
      );
    }catch(e){
      throw Exception("erreur lors de la requete ${e.toString()}");
    }
  }

}