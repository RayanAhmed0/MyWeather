// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget additionalInformation(
    String wind, String humidity, String pressure, String feelsLike) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Container(
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
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "wind".tr(),
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xffF8F9FA)),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "pressure".tr(),
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xffF8F9FA)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.air, color: Color(0xffF8F9FA)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$wind",
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xffF8F9FA)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Icon(Icons.compress, color: Color(0xffF8F9FA)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$pressure",
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xffF8F9FA)),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "humidity".tr(),
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xffF8F9FA)),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "feelslike".tr(),
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xffF8F9FA)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Color(0xffF8F9FA)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$humidity",
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xffF8F9FA)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Icon(Icons.device_thermostat, color: Color(0xffF8F9FA)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$feelsLike",
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xffF8F9FA)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
