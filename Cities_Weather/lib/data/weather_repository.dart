import 'package:Cities_Weather/data/weather_api_client.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/models/weather.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  Future<Weather> getWeatherForCity(City city) async {
    return weatherApiClient.fetchWeather(city.latitude, city.longitude);
  }
}
