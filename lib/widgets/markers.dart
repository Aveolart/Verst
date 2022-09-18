// ignore_for_file: prefer_const_constructors, prefer_final_fields

// import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewMarkers {
  static Marker _kDestination = Marker(
    markerId: MarkerId("_kDestination"),
    infoWindow: InfoWindow(title: "Destination"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(37.43296265331129, -122.08832357078792),
  );
}
