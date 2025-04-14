import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/constants/cosntants.dart';
import 'package:weather_app/features/weather/data/models/weahter_data_model.dart';

part 'weather_api_service.g.dart';



@RestApi(baseUrl: baseUrl)
abstract class WeatherApiService{
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET("/current.json")
  Future<HttpResponse<WeatherDataModel>> getCurrentWeather(
    @Query('key') String apiKey,
    @Query('q') String city,
    @Query('aqi') String aqi,
  );
}