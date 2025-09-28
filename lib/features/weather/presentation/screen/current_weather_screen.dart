import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_state.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF74bd5), Color(0xFFACB6E5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _controller,
                      onChanged: (value) {
                        if (value.trim().length >= 2) {
                          context.read<WeatherBloc>().add(
                            FetchSuggestionsEvent(query: value.trim()),
                          );
                        }
                      },
                      onSubmitted: (value) {
                        context.read<WeatherBloc>().add(
                          FetchWeatherEvent(cityName: value.trim()),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Enter city name",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Suggestions
                    if (state.suggestions != null &&
                        state.suggestions!.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.suggestions!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.suggestions![index].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              subtitle: Text(
                                "${state.suggestions![index].region}, ${state.suggestions![index].country}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              onTap: () {
                                _controller.text =
                                    state.suggestions![index].name;
                                context.read<WeatherBloc>().add(
                                  FetchWeatherEvent(
                                      cityName: _controller.text.trim()),
                                );
                              },
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Loading
                    if (state.status.isLoading)
                      const Center(child: CircularProgressIndicator()),

                    // Weather data found
                    if (state.weatherData != null) ...[
                      const SizedBox(height: 20),
                      _buildWeatherCard(state),
                    ],

                    // Error handling
                    if (state.status.isError && (state.message.isNotEmpty))
                      Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                              color: Colors.redAccent, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // Empty result
                    if (state.weatherData == null &&
                        state.status != WeatherStatus.loading &&
                        !state.status.isError)
                      const Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard(WeatherState state) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            state.weatherData!.location.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Image.network(
            "https:${state.weatherData!.current.condition.icon}",
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            "${state.weatherData!.current.tempC} °C",
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            state.weatherData!.current.condition.text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "${state.weatherData!.current.windKph} km/h",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      "Wind",
                      style: TextStyle(
                        fontSize: 15,
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
                      "${state.weatherData!.current.humidity} %",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      "Humidity",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
