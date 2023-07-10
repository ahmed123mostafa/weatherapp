import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/providers/provider_weather.dart';
import 'package:weatherapp/view/search.dart';

class welcomescrean extends StatefulWidget {
  welcomescrean({Key? key}) : super(key: key);

  @override
  State<welcomescrean> createState() => _welcomescreanState();
}

class _welcomescreanState extends State<welcomescrean> {
  void UpdateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(UpdateUi: UpdateUi)));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: weatherData == null
            ? Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ]),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                  Color.fromARGB(255, 114, 108, 108)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<WeatherProvider>(context).dataserarch!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "updated at${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}:${weatherData!.date.millisecond.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage(
                            weatherData!.getImage(),
                          ),
                        ),
                        Text("Temp:${weatherData!.temp.toInt()}",
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        Column(
                          children: [
                            Text("maxtemp:${weatherData!.maxTemp.toInt()}"),
                            Text("mintemp:${weatherData!.minTemp.toInt()}"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      weatherData!.weatherstateName,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ));
  }
}
