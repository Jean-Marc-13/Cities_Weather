import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Cities_Weather/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final url = '$baseUrl?latitude=$latitude&longitude=$longitude&hourly=temperature_2m';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final temperature = jsonData['temperature']['value'].toString();
      final humidity = jsonData['humidity']['value'].toString();
      final windSpeed = jsonData['windspeed']['value'].toString();
      final weatherCondition = jsonData['weathercode']['value'].toString();

      return Weather(
        temperature: temperature,
        humidity: humidity,
        windSpeed: windSpeed,
        weatherCondition: weatherCondition,
      );
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
