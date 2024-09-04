import 'package:flutter/material.dart';
import 'package:weatherapp/views/widgets/NoWeather.dart';

class NonWeather extends StatelessWidget {
  const NonWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.white,
            ))
      ],
      backgroundColor: Colors.blue,
    ),
      body: Noweather(),
    );
  }
}