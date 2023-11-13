// ignore_for_file: unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherApiClientCity {
  Future<Weather>? getCurrentWeatherCity(
    String? city,
  ) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=662e0c45336c6a3bb97e2d37c5be112b&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
 

    print(
        "${Weather.fromJson(body).cityName} , ${Weather.fromJson(body).desc}");
    // print(
    //     "DT ${DateTime.fromMillisecondsSinceEpoch(Weather.fromJson(body).dt! * 1000)}");
    return Weather.fromJson(body);
  }
}
