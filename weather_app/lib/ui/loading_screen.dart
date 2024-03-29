import 'package:flutter/material.dart';
import 'package:weather_app/services/geolocation_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<Position> getLocationData() async {
    return await GeolocationService().getCurrentPosition();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  
}