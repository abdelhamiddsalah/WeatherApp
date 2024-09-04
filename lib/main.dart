
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/cubit/weather_cubit_cubit.dart';
import 'package:weatherapp/services/GetWeather.dart';
import 'package:weatherapp/views/screens/Home.dart';
import 'package:weatherapp/views/screens/Search_weather.dart';


void main() async{
 await FetchWeatherData().fetchWeatherData(city: 'cairo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder:(context)=> MaterialApp(
          theme: ThemeData(primarySwatch: getColor(BlocProvider.of<WeatherCubit>(context).weatherModel?.weatherCondition)),
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          routes: {
            'searchweather': (context) => Search(),
          },
          home: Home(),
        ),
      ),
    );
  }
}
MaterialColor getColor(String? condition){
  if (condition == 'Sunny') {
    return Colors.orange;
  }else if(condition == 'Clear '){
  return Colors.orange;
  }else if(condition == 'Light rain '){
  return Colors.orange;
  }else if(condition=='Heavy snow'){
  return Colors.orange;
  }else if(condition=='Patchy rain nearby'){
    return Colors.grey;
  }else if(condition=='Partly cloudy'){
    return Colors.orange;
  }
  
  else{
    return Colors.green;
  }
}
