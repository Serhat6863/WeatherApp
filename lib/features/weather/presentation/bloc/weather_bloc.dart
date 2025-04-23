import 'package:bloc/bloc.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepositoryImpl weatherRepository;
  
  WeatherBloc({required this.weatherRepository}) : super(WeatherState.initiel()){
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
    on<FetchSuggestionsEvent>(_onFetchSuggestionsEvent);
  }
  
  
  Future<void> _onFetchWeatherEvent(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherState.loading());
    try{
      final weatherData = await weatherRepository.getCurrentWeather(event.cityName);
      emit(WeatherState.loaded(weatherData));
    }catch(e){
      emit(WeatherState.error(e.toString()));
    }
  }

  Future<void> _onFetchSuggestionsEvent(FetchSuggestionsEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherState.loading());
    try{
      final suggestions = await weatherRepository.searchLocation(event.query);
      emit(WeatherState.suggestions(suggestions));
    }catch(e){
      emit(WeatherState.error(e.toString()));
    }
  }





}