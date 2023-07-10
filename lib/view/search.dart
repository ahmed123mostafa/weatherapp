// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/providers/provider_weather.dart';
import 'package:weatherapp/services/weather_services.dart';

class Search extends StatelessWidget {
  String? datasearch;
  Search({this.UpdateUi});
  VoidCallback? UpdateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (data) {
              datasearch = data;
            },
            onSubmitted: (data) async {
              datasearch = data;
              weatherservices services = weatherservices();
              weathermodel weather =
                  await services.getweather(datasearch: datasearch!);
              Navigator.pop(context);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).dataserarch =
                  datasearch;
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () async {
                      weatherservices services = weatherservices();
                      weathermodel weather =
                          await services.getweather(datasearch: datasearch!);
                      Navigator.pop(context);

                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .dataserarch = datasearch;
                    },
                    child: (Icon(Icons.search))),
                label: Text("search"),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                hintText: "Enter a City",
                border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}
