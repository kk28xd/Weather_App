import '../../services/WeatherModel.dart';

class WeatherState {}
class ThereIsNoWeather extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoaded({required this.weatherModel});
}
class WeatherFailure extends WeatherState {}