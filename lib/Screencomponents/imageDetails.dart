import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// text

Widget text(text) {
  return Text(
    text.toString(),
    style: GoogleFonts.courierPrime(
      letterSpacing: 1.0,
      fontSize: 20.0,
    ),
  );
}

// Add Description

Widget description(description) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 15),
    child: Text(
      description.toString(),
      style: GoogleFonts.mPlusRounded1c(
        fontSize: 15,
        letterSpacing: 2,
      ),
    ),
  );
}

// Degree

Widget degree(degree) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        degree.toString(),
        style: GoogleFonts.quicksand(
          fontSize: 30.0,
          letterSpacing: 2,
          fontWeight: FontWeight.w900,
        ),
      ),
      Container(
        child: Text(
          degree == "" ? "" : "°C",
          style: GoogleFonts.quicksand(
            fontSize: 25.0,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    ],
  );
}

// other Details

Widget otherDetails(data) {
  if (data != null) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 250.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.thermometerHalf,
                color: Colors.white38,
              ),
              Container(
                margin: EdgeInsets.only(left: 7),
                child: Text(data["current"]["wind_deg"].toString()),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.white38,
              ),
              Container(
                margin: EdgeInsets.only(left: 7),
                child: Text(data["current"]["wind_speed"].toString()),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.sun,
                color: Colors.white38,
              ),
              Container(
                margin: EdgeInsets.only(left: 7),
                child: Text(data["current"]["humidity"].toString()),
              ),
            ],
          ),
        ],
      ),
    );
  } else {
    return Text("");
  }
}
