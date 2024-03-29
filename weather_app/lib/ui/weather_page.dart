import 'dart:js';

import 'package:flutter/material.dart';
import 'package:weather_app/config.dart';

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
    return const Scaffold(body: FutureBuilder());
  }
}
