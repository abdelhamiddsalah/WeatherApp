import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/cubit/weather_cubit_cubit.dart';
import 'package:weatherapp/views/screens/Non_weather.dart';
import 'package:weatherapp/views/screens/Weather.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherCubitState>(
      builder: (context, state) {
       if (state is WeatherCubitLoading) {
         return NonWeather();
       }else if (state is WeatherCubitSuccess){
           return weather(
           
           );

       }else{
        return Text('Error');
       }
      },
    );
  }
}