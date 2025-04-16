import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/domain/entities/weather_data.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF74bd5), Color(0xFFACB6E5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SearchBar(
                  hintText: "Enter city name",
                  backgroundColor: WidgetStateProperty.all(Colors.white.withValues()),
                  elevation: WidgetStateProperty.all(2),
                  leading: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ) ,
                  onSubmitted: (String value){
                    context.read<WeatherBloc>().add(FetchWeatherEvent(cityName: value));
                  },
                ),




                const SizedBox(height: 20),

                BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context,state){
                    if(state.status.isError){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state){

                    if(state.status.isError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    }else if(state.status.isLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if(state.status.isLoaded && state.weatherData != null){
                      final weatherLocation = state.weatherData!.location;
                      final weatherCurrent = state.weatherData!.current;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 10,),

                                Text(
                                  textAlign: TextAlign.center,
                                  weatherLocation.name,
                                  style: TextStyle(
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 10,),

                                Image.network(
                                  "https:${weatherCurrent.condition.icon}",
                                  height: 100,
                                  scale: 0.5,

                                ),

                                const SizedBox(height: 10,),

                                Text(
                                  textAlign: TextAlign.center,
                                  "${weatherCurrent.tempC.toString()} °C",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 10,),

                                Text(
                                  textAlign: TextAlign.center,
                                  weatherCurrent.condition.text,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 50,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${weatherCurrent.windKph} km/h",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),

                                          Text(
                                            "Wind",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${weatherCurrent.humidity} %",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),

                                          Text(
                                            "Humidity",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )








                              ],
                            ),
                          ),

                        ),
                      );

                    }

                    return const Center(
                      child: Text("No data"),
                    );


                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

