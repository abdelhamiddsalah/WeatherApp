import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/services/GetWeather.dart';
import 'package:weatherapp/services/WeatherModel.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  WeatherCubit() : super(WeatherCubitLoading());

  WeatherModel? weatherModel;

  // Method to fetch weather data
  Future<void> fetchData({required String cityName}) async {
    try {
    WeatherModel?  weatherModel = await FetchWeatherData().fetchWeatherData(city: cityName);
      emit(WeatherCubitSuccess( weatherModel: WeatherModel(temp: weatherModel!.temp, cityName: cityName, image: weatherModel.image, maxTemp: weatherModel.maxTemp, minTemp: weatherModel.minTemp, weatherCondition: weatherModel.weatherCondition, date: weatherModel.date)));
    } catch (e) {
      emit(WeatherCubitFailure());
    }
  }
}
