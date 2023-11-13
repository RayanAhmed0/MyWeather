import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/navigation_drawer.dart';

class About_page extends StatefulWidget {
  About_page({Key? key}) : super(key: key);

  @override
  State<About_page> createState() => _About_pageState();
}

DateTime currentTime = new DateTime.now();
var _currentTime12 = DateFormat('j').format(currentTime);

class _About_pageState extends State<About_page> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "aboutheader".tr(),
                    style:
                        GoogleFonts.tajawal(fontSize: 48,  color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              // font size settings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "about".tr(),
                                style: GoogleFonts.tajawal(
                                    fontSize: 32,  color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    // appearance settings
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "whatisourgoal".tr(),
                                  style: GoogleFonts.tajawal(
                                      fontSize: 32,  color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ), // language settings
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "disclaimer".tr(),
                                  style: GoogleFonts.tajawal(
                                      fontSize: 32,  color: _currentTime12.contains(" AM")
                ? Colors.black
                : Color(0xfffafafa),),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
