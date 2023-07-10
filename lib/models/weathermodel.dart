import 'dart:ui';

import 'package:flutter/material.dart';

class weathermodel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherstateName;

  weathermodel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherstateName});
  factory weathermodel.fromjson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return weathermodel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherstateName: jsonData["condition"]["text"]);
  }

  //@override
  //String toString() {
  //return "temp:$temp,date:$date,maxtemp:$maxTemp,mintemp:$minTemp";
  // }

  String getImage() {
    if (weatherstateName == 'Sunny' ||
        weatherstateName == 'Clear' ||
        weatherstateName == 'partly cloudy') {
      return 'images/cloud.png';
    } else if (weatherstateName == 'Blizzard' ||
        weatherstateName == 'Patchy snow possible' ||
        weatherstateName == 'Patchy sleet possible' ||
        weatherstateName == 'Patchy freezing drizzle possible' ||
        weatherstateName == 'Blowing snow') {
      return 'images/snow.png';
    } else if (weatherstateName == 'Freezing fog' ||
        weatherstateName == 'Fog' ||
        weatherstateName == 'Heavy Cloud' ||
        weatherstateName == 'Mist' ||
        weatherstateName == 'Fog') {
      return 'images/cloud.png';
    } else if (weatherstateName == 'Patchy rain possible' ||
        weatherstateName == 'Heavy Rain' ||
        weatherstateName == 'Showers	') {
      return 'images/rainy.png';
    } else if (weatherstateName == 'Thundery outbreaks possible' ||
        weatherstateName == 'Moderate or heavy snow with thunder' ||
        weatherstateName == 'Patchy light snow with thunder' ||
        weatherstateName == 'Moderate or heavy rain with thunder' ||
        weatherstateName == 'Patchy light rain with thunder') {
      return 'images/storm.png';
    } else {
      return 'images/cloudy.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherstateName == 'Sunny' ||
        weatherstateName == 'Clear' ||
        weatherstateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherstateName == 'Blizzard' ||
        weatherstateName == 'Patchy snow possible' ||
        weatherstateName == 'Patchy sleet possible' ||
        weatherstateName == 'Patchy freezing drizzle possible' ||
        weatherstateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherstateName == 'Freezing fog' ||
        weatherstateName == 'Fog' ||
        weatherstateName == 'Heavy Cloud' ||
        weatherstateName == 'Mist' ||
        weatherstateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherstateName == 'Patchy rain possible' ||
        weatherstateName == 'Heavy Rain' ||
        weatherstateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherstateName == 'Thundery outbreaks possible' ||
        weatherstateName == 'Moderate or heavy snow with thunder' ||
        weatherstateName == 'Patchy light snow with thunder' ||
        weatherstateName == 'Moderate or heavy rain with thunder' ||
        weatherstateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
