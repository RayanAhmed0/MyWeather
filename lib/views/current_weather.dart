// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);
Widget currentWeather(
    IconData icon, String temp, String location, String desc) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "$location".tr().toUpperCase(),
                    style: GoogleFonts.tajawal(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      // letterSpacing: 4,
                      color: _currentTime12.contains(" AM")
                          ? Colors.black
                          : Color(0xfffafafa),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "$temp",
                  style: GoogleFonts.tajawal(
                    fontSize: 115,
                    fontWeight: FontWeight.w500,
                    color: _currentTime12.contains(" AM")
                        ? Colors.black
                        : Color(0xfffafafa),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [weatherdesc(desc)],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget weatherdesc(String description) {
  return Container(
    child: Row(
      children: [
        Text(
          description.tr().toUpperCase(),
          style: GoogleFonts.tajawal(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),
          ),
        ),
        Image.asset(weatherdescicon(description))
      ],
    ),
  );
}

String weatherdescicon(String description) {
  switch (description) {
    case "clear sky":
      return "assets/weathericons/clearsky.png";

    case "few clouds":
      return "assets/weathericons/fewclouds.png";

    case "scattered clouds":
      return "assets/weathericons/scatteredclouds.png";

    case "broken clouds":
    case "overcast clouds":
      return "assets/weathericons/brokenclouds.png";

    case "shower rain":
    case "light intensity shower rain":
    case "heavy intensity shower rain":
    case "ragged shower rain":
    case "light intensity drizzle":
    case "drizzle":
    case "heavy intensity drizzle":
    case "light intensity drizzle rain":
    case "drizzle rain":
    case "heavy intensity drizzle rain":
    case "shower rain and drizzle":
    case "heavy shower rain and drizzle":
    case "shower drizzle":
      return "assets/weathericons/rainshower.png";

    case "rain":
    case "light rain":
    case "moderate rain":
    case "heavy intensity rain":
    case "very heavy rain":
    case "extreme rain":
      return "assets/weathericons/rain.png";

    case "thunderstorm":
    case "thunderstorm with light rain":
    case "thunderstorm with rain":
    case "thunderstorm with heavy rain":
    case "light thunderstorm":
    case "heavy thunderstorm":
    case "ragged thunderstorm":
    case "thunderstorm with light drizzle":
    case "thunderstorm with drizzle":
    case "thunderstorm with heavy drizzle":
      return "assets/weathericons/thunderstorm.png";

    case "snow":
    case "light snow":
    case "heavy snow":
    case "sleet":
    case "light shower sleet":
    case "shower sleet":
    case "light rain and snow":
    case "rain and snow":
    case "light shower snow":
    case "shower snow":
    case "heavy shower snow":
      return "assets/weathericons/snow.png";

    case "mist":
    case "smoke":
    case "haze":
    case "sand/dust whirls":
    case "fog":
    case "sand":
    case "dust":
    case "volcanic ash":
    case "squalls":
    case "tornado":
      return "assets/weathericons/mist.png";

    default:
      return "assets/weathericons/clearsky.png";
  }
}
