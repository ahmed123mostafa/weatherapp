import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weathermodel.dart';

class weatherservices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = '3677bed892474b30b7a122242220806';
  Future<weathermodel> getweather({required String datasearch}) async {
    Uri uri =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$datasearch&days=7");

    http.Response response = await http.get(uri) as http.Response;
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    weathermodel weather = weathermodel.fromjson(data);
    return weather;
  }
}
