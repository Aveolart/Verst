// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verst/LoginService/auth_service.dart';
import 'package:verst/models/httpmodel.dart';
import 'package:verst/models/serviceh.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final Completer<GoogleMapController> _controller = Completer();
  PolylinePoints polylinePoints = PolylinePoints();

  GoogleMapController? _googleMapController;
  String googleAPiKey = "AIzaSyADJuw8QrVLY72G2TcSAnD2RVuGXFMilD0";

  Set<Marker> markers = {}; //markers for google map
  // Map<PolylineId, Polyline> polylines = {}; // to show directions

  Marker? origin;
  Marker? destination;
  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  var isLoading = false;

  Distance? distanceData;
  calcDistance() async {
    distanceData = await RemoteCall().getDistance(
      destination!.position.latitude.toString(),
      destination!.position.longitude.toString(),
      origin!.position.latitude.toString(),
      origin!.position.longitude.toString(),
    );
    if (distanceData != null) {
      setState(() {
        isLoading = true;
      });
    }
  }
  // static Marker _kOrigin = Marker(
  //   markerId: MarkerId("_kOrigin"),
  //   infoWindow: InfoWindow(title: "Google Plex"),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(37.42796133580664, -122.085749655962),
  // );

  // static Marker _kDestination = Marker(
  //   markerId: MarkerId("_kDestination"),
  //   infoWindow: InfoWindow(title: "Destination"),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //   position: LatLng(37.43296265331129, -122.08832357078792),
  // );

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController searchController = TextEditingController();

  //Distance calculate

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Verst calculator"),
        centerTitle: false,
        actions: [
          if (origin != null)
            TextButton(
              onPressed: () {
                _googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: origin!.position,
                      zoom: 15,
                      tilt: 50.0,
                    ),
                  ),
                );
              },
              child: Text(
                "ORIGIN",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              ),
            ),
          if (destination != null)
            TextButton(
              onPressed: () {
                _googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: destination!.position,
                      zoom: 15,
                      tilt: 50.0,
                    ),
                  ),
                );
              },
              child: Text(
                "DESTINATION",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       // Row(
      //       //   children: [
      //       //     // Expanded(
      //       //     //   child: TextFormField(
      //       //     //     controller: searchController,
      //       //     //     textCapitalization: TextCapitalization.words,
      //       //     //     onChanged: (value) {
      //       //     //       debugPrint(value);
      //       //     //     },
      //       //     //     decoration: InputDecoration(
      //       //     //       hintText: "Enter a city",
      //       //     //     ),
      //       //     //   ),
      //       //     // ),
      //       //     IconButton(
      //       //       onPressed: () {},
      //       //       icon: Icon(Icons.search),
      //       //     )
      //       //   ],
      //       // ),

      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,

            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kGooglePlex,
            // polylines: {
            //   if(_calculate != null)
            // },
            // polylines: {_kPolyline},
            onMapCreated: (controller) {
              _googleMapController = controller;
            },
            markers: {
              // _kOrigin,
              // _kDestination,
              if (origin != null) origin!,
              if (destination != null) destination!,
            },
            onLongPress: _addMarker,
          ),
          Positioned(
            left: 10,
            bottom: 30,
            child: Container(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    isLoading
                        ? "Total Distance is ${distanceData?.routes![0].legs![0].distance!.text}"
                        : "Total Distance is 0.0 mi",
                    // isLoading ? "${origin!.position.longitude}" : "0.00",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 100,
            child: GestureDetector(
              onTap: () {
                // Calculate().getDirections(
                //         origin?.position.latitude,
                //         origin?.position.longitude,
                //         destination?.position.latitude,
                //         destination?.position.longitude);
                // print(origin);
                // print(destination);
                // setState(() {
                //   isLoading = true;
                // });
                // print(origin?.position.latitude.toString());
                // print(origin?.position.longitude.toString());
                // print(destination?.position.latitude.toString());
                // print(destination?.position.longitude.toString());
                // calcDistance();
                AuthService().signOut();
                // AuthService().signOut();
                //     // setState(() {});
                //     // _googleMapController
                //     //     ?.animateCamera(CameraUpdate.newCameraPosition(_kLake));
                //   }, //_goToTheLake,
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Sign Out",
                    // isLoading ? "${origin!.position.longitude}" : "0.00",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Calculate().getDirections(
      //     //     origin?.position.latitude,
      //     //     origin?.position.longitude,
      //     //     destination?.position.latitude,
      //     //     destination?.position.longitude);
      //     // print(origin);
      //     // print(destination);
      //     // setState(() {
      //     //   isLoading = true;
      //     // });
      //     print(origin?.position.latitude.toString());
      //     print(origin?.position.longitude.toString());
      //     print(destination?.position.latitude.toString());
      //     print(destination?.position.longitude.toString());
      //     calcDistance();
      //     // AuthService().signOut();
      //     // setState(() {});
      //     // _googleMapController
      //     //     ?.animateCamera(CameraUpdate.newCameraPosition(_kLake));
      //   }, //_goToTheLake,
      //   child: Icon(Icons.gps_fixed),
      // ),
    );
  }

  void _addMarker(LatLng pos) {
    if (origin == null || (origin != null && destination != null)) {
      setState(() {
        origin = Marker(
          markerId: MarkerId("Origin"),
          infoWindow: InfoWindow(title: "Origin"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: pos,
        );
        //Lets reset the destination
        destination = null;
        isLoading = false;
      });
    } else {
      //After setting the Origin, then we set the destination
      setState(() {
        destination = Marker(
          markerId: MarkerId("Destination"),
          infoWindow: InfoWindow(title: "Destination"),
          icon: BitmapDescriptor.defaultMarker,
          position: pos,
        );
      });
      // calcDistance();
    }
  }
}
