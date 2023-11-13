import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/navigation_drawer.dart';

class Settings_Page extends StatefulWidget {
  Settings_Page({Key? key}) : super(key: key);

  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);

class _Settings_PageState extends State<Settings_Page> {
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _currentTime12.contains(" AM")
                  ? AssetImage("assets/day.png")
                  : AssetImage("assets/night.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    foregroundColor: Colors.black),
                child: Text(
                  "clanguage".tr(),
                  style: GoogleFonts.tajawal(
                      fontSize: 20,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                          bottom: Radius.circular(30)),
                    ),
                    backgroundColor: _currentTime12.contains(" AM")
                        ? Colors.white
                        : Colors.white,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  context.setLocale(Locale("ar", "SA"));
                                });
                              },
                              child: Text(
                                "العربية",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  context.setLocale(Locale("en", "US"));
                                });
                              },
                              child: Text("English",
                                  style: TextStyle(fontSize: 28)),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
