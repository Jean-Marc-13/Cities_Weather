import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Cities_Weather/bloc/weather_bloc.dart';
import 'package:Cities_Weather/bloc/weather_event.dart';
import 'package:Cities_Weather/bloc/weather_state.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/ui/screens/city_detail_screen.dart';

class CitySearchScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void _searchCity(BuildContext context) {
    final cityName = _textEditingController.text;
    if (cityName.isNotEmpty) {
      final city = City(id: '1', name: cityName, latitude: 0, longitude: 0);
      BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city: city));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CityDetailScreen(city: city)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche de ville(s)'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              labelText: 'Entrer un nom de ville',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => _searchCity(context),
              ),
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return CircularProgressIndicator();
              } else if (state is WeatherError) {
                return Text('Erreur de recherche de la data météo');
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
