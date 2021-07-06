import "package:flutter/material.dart";
import "./imageDetails.dart";

// Reload button
Widget reload() {
  return Container(
    child: Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Colors.white30,
        child: Text("Please Restart Application"),
      ),
    ),
  );
}
// App's Top Section

Widget topBar(location) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.white38,
                size: 20.0,
              ),
            ),
            Text(
              location != null ? location : "loading",
              style: TextStyle(),
            ),
          ],
        ),
      ],
    ),
  );
}

// Widget Handling App's image

Widget imageLarge(weatherData) {
  if (weatherData != null) {
    String label = weatherData["current"]["weather"][0]["main"] == "Clouds"
        ? "sunshine"
        : "HeavyRain";
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Image.asset(
        "images/Large/$label.png",
        width: 130.0,
        height: 130.0,
      ),
    );
  } else {
    return Text("");
  }
}

// widget's Image details.. gets its components from imageDetails.dart

Widget imageDetails(weatherData, loading) {
  var textData = weatherData != null
      ? weatherData["current"]["weather"][0]["main"]
      : loading;
  var descriptiondata = weatherData != null
      ? weatherData["current"]["weather"][0]["description"]
      : loading;
  var degreeData = weatherData != null ? weatherData["current"]["temp"] : "";
  var otherDetailsData = weatherData;
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    child: Column(
      children: <Widget>[
        text(textData),
        description(descriptiondata),
        degree(degreeData),
        otherDetails(otherDetailsData),
        loading == "Unable To Load" ? reload() : Text("")
      ],
    ),
  );
}
