import 'dart:ui';

import 'package:flcourseproj/views/about.dart';
import 'package:flcourseproj/views/home.dart';
import 'package:flcourseproj/views/settings.dart';
import 'package:flcourseproj/views/weather_forecast.dart';
import 'package:flcourseproj/views/world_weather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors
class nav_drawer extends StatelessWidget {
  const nav_drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            title: Text("Home".tr(), style: GoogleFonts.tajawal(fontSize: 24)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home_Page()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.thermostat,
              size: 30,
            ),
            title: Text("Weather Forecast".tr(),
                style: GoogleFonts.tajawal(fontSize: 24)),
            onTap: () {
              Navigator.pop(context);
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Forecast_page()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
              size: 30,
            ),
            title: Text("World Weather".tr(),
                style: GoogleFonts.tajawal(fontSize: 24)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => wweather_page()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title:
                Text("Settings".tr(), style: GoogleFonts.tajawal(fontSize: 24)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings_Page()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              size: 30,
            ),
            title: Text("About".tr(), style: GoogleFonts.tajawal(fontSize: 24)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About_page()),
              );
            },
          ),
        ],
      ),
    );
  }
}
