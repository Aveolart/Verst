import 'dart:convert';

import 'package:verst/models/httpmodel.dart';
import 'package:http/http.dart' as http;

class RemoteCall {
  Future<Distance?> getDistance(
    String destinationLat,
    String destinationLng,
    String originLat,
    String originLng,
  ) async {
    var client = http.Client();
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?destination=$destinationLat,%20$destinationLng&origin=$originLat,%20$originLng&key=AIzaSyADJuw8QrVLY72G2TcSAnD2RVuGXFMilD0");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(response.body);
      return Distance.fromJson(body);
    } else {
      print(response.body);
    }
  }
}
