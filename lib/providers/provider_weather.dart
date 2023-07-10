import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier {
  String? dataserarch;
  weathermodel? _weatherData;
  set weatherData(weathermodel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weathermodel? get weatherData => _weatherData;
}
