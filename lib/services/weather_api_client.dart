// ignore_for_file: unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(
      String? latitude, String? longitude) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=e55b971fa3b3acdd22ee978a7523fa62&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    print(
        "${Weather.fromJson(body).cityName} , ${Weather.fromJson(body).desc}");
    print(
        "Sunset : ${DateTime.fromMillisecondsSinceEpoch(Weather.fromJson(body).sunset! * 1000)}");
    print(
        "Sunrise : ${DateTime.fromMillisecondsSinceEpoch(Weather.fromJson(body).sunrise! * 1000)}");

    return Weather.fromJson(body);
  }
}
