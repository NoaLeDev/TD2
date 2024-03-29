import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config.dart';
import 'package:weather_app/services/openweathermap_api.dart';

import '../models/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({
    required this.locationName,
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final String locationName;
  final double latitude;
  final double longitude;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    var api = context.read<OpenWeatherMapApi>();
    
    return Scaffold(
      body: 
        FutureBuilder(
          future:api.getWeather(widget.latitude, widget.longitude),
          builder:(context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Une erreur est survenue.\n${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const Text('Aucun résultat pour cette recherche.');
            }

            Weather weather = snapshot.data!;

            return Image.network(api.getIconUrl(weather.icon));
          },
        )
    );
  }
}
