import 'package:flutter/material.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/ui/widgets/city_item.dart';

class CityListScreen extends StatelessWidget {
  final List<City> cities;

  CityListScreen({required this.cities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des villes'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return CityItem(city: cities[index]);
        },
      ),
    );
  }
}
