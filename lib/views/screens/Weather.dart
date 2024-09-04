import 'package:flutter/material.dart';
import 'package:weatherapp/services/WeatherModel.dart';
import 'package:weatherapp/views/widgets/WithWeather.dart';



// ignore: camel_case_types
class weather extends StatelessWidget {
  const weather({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(appBar: AppBar(
       title:const Text(
        "Weather App",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {
               Navigator.pushNamed(context, 'searchweather');
            },
            icon:const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
      backgroundColor: Colors.blue,
    ),
    body: WithWeather(),
    );
       
  }
}
  