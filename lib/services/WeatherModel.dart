import 'dart:convert';

class WeatherModel {
   final double temp;
   final String cityName;
   final String? image;
   final double maxTemp;
   final double minTemp;
   final String weatherCondition;
   final DateTime date;

  WeatherModel({required this.temp, required this.cityName,
   required this.image, required this.maxTemp, required this.minTemp,
    required this.weatherCondition, required this.date});

    factory WeatherModel.fromJson(json){
      return WeatherModel(
        image:  json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
         cityName: json['location']['name'],
           maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
            minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
             weatherCondition:  json['current']['condition']['text'],
              date: DateTime.parse(json['current']['last_updated']),
              );
    }
}
