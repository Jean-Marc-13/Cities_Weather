import 'package:flutter/material.dart';
import 'package:Cities_Weather/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Temperature: ${weather.temperature}'),
          Text('Humidité: ${weather.humidity}'),
          Text('Vitesse du vent: ${weather.windSpeed}'),
          Text('Conditions météo: ${weather.weatherCondition}'),
        ],
      ),
    );
  }
}
