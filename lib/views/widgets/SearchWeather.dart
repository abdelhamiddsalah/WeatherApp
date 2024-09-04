import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/cubit/cubit/weather_cubit_cubit.dart';
import 'package:weatherapp/services/GetWeather.dart';


class Searchweather extends StatelessWidget {
  const Searchweather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Material(
            child: TextField(
              onSubmitted: (value) {
          var getweatherdata= BlocProvider.of<WeatherCubit>(context);
            getweatherdata.fetchData(cityName: value);
            Navigator.pop(context);
              },
              decoration: InputDecoration(
                labelText: "Enter a city",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                suffixIcon:const Icon(Icons.search)
              ),
            ),
          )
        ],
        
      ),
    );
  }
}