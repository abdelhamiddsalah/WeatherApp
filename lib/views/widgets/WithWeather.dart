import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/cubit/weather_cubit_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/services/WeatherModel.dart';

class WithWeather extends StatelessWidget {
  const WithWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherCubitState>(
      builder: (context, state) {
        if (state is WeatherCubitLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherCubitSuccess) {
          WeatherModel weatherModel = state.weatherModel;

          return Container(
            decoration: BoxDecoration(
           color:    getColor(weatherModel.weatherCondition),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(weatherModel.cityName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  Text('Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      Text('${weatherModel.temp ?? 0}°C',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Column(
                        children: [
                          Text('Max Temp: ${weatherModel.maxTemp ?? 0}°C'),
                          Text('Min Temp: ${weatherModel.minTemp ?? 0}°C'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Text(weatherModel.weatherCondition ?? 'Unknown Condition',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
          );
        } else if (state is WeatherCubitFailure) {
          return Center(child: Text('Failed to load weather data.'));
        } else {
          return Center(child: Text('Please enter a city name.'));
        }
      },
    );
  }
}
