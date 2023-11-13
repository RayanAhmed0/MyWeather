// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flcourseproj/models/weather_forecast_model.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherApiClientForecast {
  Future<WeatherForecast>? getCurrentWeatherForecast(String? city) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=e55b971fa3b3acdd22ee978a7523fa62&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // print(
    //     "${Weather.fromJson(body).cityName} , ${Weather.fromJson(body).desc}");
    // print(
    //     "Sunset : ${DateTime.fromMillisecondsSinceEpoch(WeatherForecast.fromJson(body).dt1! * 1000)}");
    // print(
    //     "Sunrise : ${DateTime.fromMillisecondsSinceEpoch(Weather.fromJson(body).sunrise! * 1000)}");

    return WeatherForecast.fromJson(body);
  }
}
