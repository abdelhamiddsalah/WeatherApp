import 'package:flutter/material.dart';
import 'package:weatherapp/views/widgets/SearchWeather.dart';



class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body:  Searchweather(),
    );
  }
}