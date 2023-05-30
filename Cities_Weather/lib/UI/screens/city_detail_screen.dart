import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Cities_Weather/bloc/weather_bloc.dart';
import 'package:Cities_Weather/bloc/weather_event.dart';
import 'package:Cities_Weather/bloc/weather_state.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/models/weather.dart';
import 'package:Cities_Weather/ui/widgets/weather_card.dart';

class CityDetailScreen extends StatelessWidget {
  final City city;

  CityDetailScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city: city));

    return Scaffold(
      appBar: AppBar(
        title: Text(city.name),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return WeatherCard(weather: state.weather);
          } else if (state is WeatherError) {
            return Center(child: Text('Erreur de recherche de la data météo'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
