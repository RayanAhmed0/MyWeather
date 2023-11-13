// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flcourseproj/services/weather_api_client.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_model.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/progress_indicator.dart';
import 'additional_information.dart';
import 'current_weather.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

String? _currentAddress;
Position? _currentPosition;
WeatherApiClient client = WeatherApiClient();
Weather? data;

Future<void> getData() async {
  data = await client.getCurrentWeather("${_currentPosition?.latitude ?? ""}",
      "${_currentPosition?.longitude ?? ""}");
}

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);

class _Home_PageState extends State<Home_Page> {
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
          child: FutureBuilder(
            future: getData(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Circular_progress_indicator(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        // // // // // //
                        SizedBox(
                          height: 20,
                        ),
                        currentWeather(
                            _currentTime12.contains(" AM")
                                ? Icons.sunny
                                : Icons.dark_mode,
                            "${data?.temp}°",
                            "${data?.cityName}",
                            "${data?.desc}"),
                        SizedBox(
                          height: 250,
                        ),
                        additionalInformation(
                            "${data?.wind}",
                            "${data?.humidity}",
                            "${data?.pressure}",
                            "${data?.feels_like}"),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            }),
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
