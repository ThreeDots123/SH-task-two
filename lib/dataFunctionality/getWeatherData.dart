import "package:http/http.dart" as http;

Future<http.Response> getdata(lat, long) async {
  String appid = "aafedaa55f2708e9977fd8de9aae677d";
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=imperial&exclude=alerts,minutely,hourly,daily&appid=$appid";
  return await http.get(Uri.parse(url));
}
