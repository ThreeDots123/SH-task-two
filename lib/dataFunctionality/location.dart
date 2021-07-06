import 'package:geolocator/geolocator.dart';

Future<LocationPermission> requestLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();
  return permission;
}

Future<Position> position() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  return position;
}
