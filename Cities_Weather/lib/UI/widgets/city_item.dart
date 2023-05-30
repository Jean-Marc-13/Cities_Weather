import 'package:flutter/material.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/ui/screens/city_detail_screen.dart';

class CityItem extends StatelessWidget {
  final City city;

  CityItem({required this.city});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(city.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CityDetailScreen(city: city)),
        );
      },
    );
  }
}
