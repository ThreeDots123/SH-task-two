import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:src/dataFunctionality/getWeatherData.dart';
import "Screens/homeScreen.dart";
import "./dataFunctionality/location.dart";

// Please Read The Readme First...

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  WeatherAppState createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  bool permission = false;
  var data, weatherData, location;
  var loading = "loading";

  Future<void> runFunctions() async {
    await requestLocation().then((permissionData) {
      if (permissionData == LocationPermission.always) {
        permission = true;
      } else {
        permission = false;
        SystemNavigator.pop();
      }
    });
    data = await position();
    GeoCode geocode = GeoCode();
    try {
      var address = await geocode.reverseGeocoding(
          latitude: data.latitude, longitude: data.longitude);
      location =
          address.city.toString() + ", " + address.countryName.toString();
      var weather = await getdata(data.latitude, data.longitude);
      weatherData = jsonDecode(weather.body);
    } catch (e) {
      loading = "Unable To Load";
      location = "Please Check Data Connection";
    }
  }

  @override
  void initState() {
    super.initState();
    runFunctions().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0c0d17),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: HomeScreen(
            weatherData: weatherData,
            loading: loading,
            location: location,
          ),
        ),
      ),
    );
  }
}
