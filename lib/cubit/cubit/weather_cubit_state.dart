part of 'weather_cubit_cubit.dart';

@immutable
sealed class WeatherCubitState {}

final class WeatherCubitLoading extends WeatherCubitState {}
final class WeatherCubitSuccess extends WeatherCubitState {
  
final WeatherModel weatherModel;

  WeatherCubitSuccess({required this.weatherModel});
  
}
final class WeatherCubitFailure extends WeatherCubitState {}