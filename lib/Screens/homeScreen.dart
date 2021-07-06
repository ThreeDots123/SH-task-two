import "package:flutter/material.dart";
import "../Screencomponents/homeScreenComponents.dart";

class HomeScreen extends StatefulWidget {
  final weatherData, loading, location;
  HomeScreen({this.weatherData, this.location, this.loading});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topBar(widget.location),
        imageLarge(widget.weatherData),
        imageDetails(widget.weatherData, widget.loading),
      ],
    );
  }
}
