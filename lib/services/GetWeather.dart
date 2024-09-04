/*import 'package:dio/dio.dart';
import 'package:weatherapp/services/WeatherModel.dart';

class WeatherServices{
  final Dio dio;
  WeatherServices(this.dio);
  final String baseUrl='http://api.weatherapi.com';
  final String Apikey='a44393988fc14d07834234902243007';
  Future<WeatherModel> getcurrentChars({required String city})async{
  try {
    Response response=await  dio.get(
      '$baseUrl/v1/forecast.json?key=$Apikey&q=$city&days=10&aqi=no&alerts=no'
    );
    WeatherModel wemo = WeatherModel.fromJson(response.data);
    return wemo;
  }
 on DioException  catch (e) {
    final String errMessage = e.response?.data['error']['message'] ?? 'opps , ERROR';
    throw Exception(errMessage);
  }
  }
}*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/WeatherModel.dart';


class FetchWeatherData {
  Future<WeatherModel?> fetchWeatherData({required String city}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://api.weatherapi.com/v1/forecast.json?key=a44393988fc14d07834234902243007&q=$city&days=10&aqi=no&alerts=no'),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response and return a WeatherModel instance
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return WeatherModel.fromJson(jsonResponse);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
    print('Exception: $e');
      return null;
    }
  }
}


/*import 'package:dio/dio.dart';
import 'package:weatherapp/services/WeatherModel.dart';

class FetchWeatherData{
  final Dio dio;

  FetchWeatherData({required this.dio});
  Future<WeatherModel?> fetchWeatherData({required String city}) async{
    try {
      Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=a44393988fc14d07834234902243007&q=$city&days=10&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      print(response.data);
      return weatherModel;
    }on DioException catch (e) {
     throw Exception('error');
      
      
    }catch (e) {
      print('error');
      
      return null;
    }
  }

}*/
