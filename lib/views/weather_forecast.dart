import 'package:flcourseproj/models/weather_forecast_model.dart';
import 'package:flcourseproj/services/weather_api_client_forecast.dart';
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

class Forecast_page extends StatefulWidget {
  Forecast_page({Key? key}) : super(key: key);

  @override
  State<Forecast_page> createState() => _Forecast_pageState();
}

String? _currentAddress;
Position? _currentPosition;
WeatherApiClientForecast client = WeatherApiClientForecast();
WeatherForecast? data;
Future<void> getDataForecast() async {
  data = await client.getCurrentWeatherForecast("Riyadh");
}

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);

class _Forecast_pageState extends State<Forecast_page> {
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

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
                    future: getDataForecast(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp1}°",
                                "${data?.cityName}",
                                "${data?.desc1}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt1! * 1000),
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp2}°",
                                "${data?.cityName}",
                                "${data?.desc2}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt2! * 1000),
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp3}°",
                                "${data?.cityName}",
                                "${data?.desc3}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt3! * 1000),
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp4}°",
                                "${data?.cityName}",
                                "${data?.desc4}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt4! * 1000),
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp5}°",
                                "${data?.cityName}",
                                "${data?.desc5}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt5! * 1000),
                              ),
                              currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp6}°",
                                "${data?.cityName}",
                                "${data?.desc6}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt6! * 1000),
                              ),
                                currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp7}°",
                                "${data?.cityName}",
                                "${data?.desc7}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt7! * 1000),
                              ),  currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp8}°",
                                "${data?.cityName}",
                                "${data?.desc8}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt8! * 1000),
                              ),  currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp9}°",
                                "${data?.cityName}",
                                "${data?.desc9}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt9! * 1000),
                              ),  currentWeather(
                                _currentTime12.contains(" AM")
                                    ? Icons.sunny
                                    : Icons.dark_mode,
                                "${data?.temp10}°",
                                "${data?.cityName}",
                                "${data?.desc10}",
                                DateTime.fromMillisecondsSinceEpoch(
                                    data!.dt10! * 1000),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}

Widget currentWeather(
  IconData icon,
  String temp,
  String location,
  String desc,
  DateTime dt,
) {
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
                Flexible(
                  child: Text(
                    converttime(dt),
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

String converttime(DateTime dt) {
  String convertedtime = DateFormat.jms().format(dt);
  String convertedtimed = DateFormat.MEd().format(dt);

  return convertedtime + convertedtimed;
}
