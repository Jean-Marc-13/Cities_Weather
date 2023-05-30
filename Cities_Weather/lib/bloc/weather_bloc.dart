import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import 'package:bloc/bloc.dart';
import 'package:Cities_Weather/bloc/weather_event.dart';
import 'package:Cities_Weather/bloc/weather_state.dart';
import 'package:Cities_Weather/data/weather_repository.dart';
import 'package:Cities_Weather/models/city.dart';
import 'package:Cities_Weather/models/weather.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();

      try {
        final Weather weather = await weatherRepository.getWeatherForCity(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (e) {
        yield WeatherError(message: 'Erreur de recherche de la data météo');
      }
    }
  }
}

