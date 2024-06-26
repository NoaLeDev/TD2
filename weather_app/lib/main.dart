import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config.dart';
import './ui/search_page.dart';
import './services/openweathermap_api.dart';
import './services/geolocation_service.dart';


void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider(
          create: (_) => OpenWeatherMapApi(apiKey: openWeatherMapApiKey)
        ),
        Provider(
          create: (_) => GeolocationService(),
        ),
      ], 
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData.dark(),
        home: const SearchPage(),
      ),
    );
  }
}
