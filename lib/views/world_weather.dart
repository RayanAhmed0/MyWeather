import 'package:flcourseproj/services/weather_api_client_city.dart';
import 'package:flcourseproj/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flcourseproj/services/weather_api_client.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_model.dart';
import '../widgets/navigation_drawer.dart';
import 'additional_information.dart';
import 'current_weather.dart';

class wweather_page extends StatefulWidget {
  wweather_page({Key? key}) : super(key: key);

  @override
  State<wweather_page> createState() => _wweather_pageState();
}

WeatherApiClientCity client = WeatherApiClientCity();
Weather? data1, data2, data3, data4, data5, data6;

Future<void> getDataCity() async {
  data1 = await client.getCurrentWeatherCity("Mecca");
  data2 = await client.getCurrentWeatherCity("Cairo");
  data3 = await client.getCurrentWeatherCity("Moscow");
  data4 = await client.getCurrentWeatherCity("Beijing");
  data5 = await client.getCurrentWeatherCity("New York");
  data6 = await client.getCurrentWeatherCity("London");
}

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);

class _wweather_pageState extends State<wweather_page> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            size: 28, //change size on your need
            color: _currentTime12.contains(" AM")
                ? Colors.black
                : Colors.white, //change color on your need
          ),
        ),
        drawer: nav_drawer(),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _currentTime12.contains(" AM")
                  ? AssetImage("assets/day.png")
                  : AssetImage("assets/night.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scrollbar(
            radius: Radius.circular(5),
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: getDataCity(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        // if (snapshot.connectionState == ConnectionState.done) {
                        //   return Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Container(
                        //       child: Column(
                        //         children: [
                        //           // // // // // //
                        //           SizedBox(
                        //             height: 20,
                        //           ),
                        //           currentWeather(
                        //               _currentTime12.contains(" AM")
                        //                   ? Icons.sunny
                        //                   : Icons.dark_mode,
                        //               "${data1?.temp}°",
                        //               "${data1?.cityName}",
                        //               "${data1?.desc}"),
                        //           SizedBox(
                        //             height: 250,
                        //           ),
                        //           additionalInformation(
                        //               "${data1?.wind}",
                        //               "${data1?.humidity}",
                        //               "${data1?.pressure}",
                        //               "${data1?.feels_like}"),
                        //         ],
                        //       ),
                        //     ),
                        //   );
                        // }

                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                additionalInformation(
                                                    "${data1!.wind}",
                                                    "${data1!.humidity}",
                                                    "${data1!.pressure}",
                                                    "${data1!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: currentWeather(
                                    _currentTime12.contains(" AM")
                                        ? Icons.sunny
                                        : Icons.dark_mode,
                                    "${data1?.temp}°",
                                    "${data1?.cityName}",
                                    "${data1?.desc}",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                additionalInformation(
                                                    "${data2!.wind}",
                                                    "${data2!.humidity}",
                                                    "${data2!.pressure}",
                                                    "${data2!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: currentWeather(
                                      _currentTime12.contains(" AM")
                                          ? Icons.sunny
                                          : Icons.dark_mode,
                                      "${data2?.temp}°",
                                      "${data2?.cityName}",
                                      "${data2?.desc}"),
                                ),
                                GestureDetector(
                                  onTap: (() {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                additionalInformation(
                                                    "${data3!.wind}",
                                                    "${data3!.humidity}",
                                                    "${data3!.pressure}",
                                                    "${data3!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                                  child: currentWeather(
                                      _currentTime12.contains(" AM")
                                          ? Icons.sunny
                                          : Icons.dark_mode,
                                      "${data3?.temp}°",
                                      "${data3?.cityName}",
                                      "${data3?.desc}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                additionalInformation(
                                                    "${data4!.wind}",
                                                    "${data4!.humidity}",
                                                    "${data4!.pressure}",
                                                    "${data4!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: currentWeather(
                                      _currentTime12.contains(" AM")
                                          ? Icons.sunny
                                          : Icons.dark_mode,
                                      "${data4?.temp}°",
                                      "${data4?.cityName}",
                                      "${data4?.desc}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                additionalInformation(
                                                    "${data5!.wind}",
                                                    "${data5!.humidity}",
                                                    "${data5!.pressure}",
                                                    "${data5!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: currentWeather(
                                      _currentTime12.contains(" AM")
                                          ? Icons.sunny
                                          : Icons.dark_mode,
                                      "${data5?.temp}°",
                                      "${data5?.cityName}",
                                      "${data5?.desc}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Divider(
                                                  thickness: 2,
                                                ),
                                                additionalInformation(
                                                    "${data6!.wind}",
                                                    "${data6!.humidity}",
                                                    "${data6!.pressure}",
                                                    "${data6!.feels_like}")
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: currentWeather(
                                      _currentTime12.contains(" AM")
                                          ? Icons.sunny
                                          : Icons.dark_mode,
                                      "${data6?.temp}°",
                                      "${data6?.cityName}",
                                      "${data6?.desc}"),
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Circular_progress_indicator(),
                          );
                        }
                        return Container();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget weatherdesc(String description) {
  return Container(
    child: Row(
      children: [
        Text(
          description.tr().toUpperCase(),
          style: GoogleFonts.tajawal(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),
          ),
        ),
        Image.asset(
          weatherdescicon(description),
          width: 30,
        )
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

Widget currentWeather(
    IconData icon, String temp, String location, String desc) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),

              // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "$location".tr().toUpperCase(),
                    style: GoogleFonts.tajawal(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$temp",
                  style: GoogleFonts.tajawal(
                    fontSize: 24,
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
