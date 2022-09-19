// To parse this JSON data, do
//
//     final distance = distanceFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Distance {
  Distance({
    this.geocodedWaypoints,
    this.routes,
    this.status,
  });

  List<GeocodedWaypoint>? geocodedWaypoints;
  List<Route>? routes;
  String? status;

  factory Distance.fromRawJson(String str) =>
      Distance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        geocodedWaypoints: json["geocoded_waypoints"] == null
            ? null
            : List<GeocodedWaypoint>.from(json["geocoded_waypoints"]
                .map((x) => GeocodedWaypoint.fromJson(x))),
        routes: json["routes"] == null
            ? null
            : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "geocoded_waypoints": geocodedWaypoints == null
            ? null
            : List<dynamic>.from(geocodedWaypoints!.map((x) => x.toJson())),
        "routes": routes == null
            ? null
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class GeocodedWaypoint {
  GeocodedWaypoint({
    this.geocoderStatus,
    this.placeId,
    this.types,
  });

  String? geocoderStatus;
  String? placeId;
  List<String>? types;

  factory GeocodedWaypoint.fromRawJson(String str) =>
      GeocodedWaypoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) =>
      GeocodedWaypoint(
        geocoderStatus:
            json["geocoder_status"] == null ? null : json["geocoder_status"],
        placeId: json["place_id"] == null ? null : json["place_id"],
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "geocoder_status": geocoderStatus == null ? null : geocoderStatus,
        "place_id": placeId == null ? null : placeId,
        "types":
            types == null ? null : List<dynamic>.from(types!.map((x) => x)),
      };
}

class Route {
  Route({
    this.bounds,
    this.copyrights,
    this.legs,
    this.overviewPolyline,
    this.summary,
    this.warnings,
    this.waypointOrder,
  });

  Bounds? bounds;
  String? copyrights;
  List<Leg>? legs;
  Polyline? overviewPolyline;
  String? summary;
  List<dynamic>? warnings;
  List<dynamic>? waypointOrder;

  factory Route.fromRawJson(String str) => Route.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        bounds: json["bounds"] == null ? null : Bounds.fromJson(json["bounds"]),
        copyrights: json["copyrights"] == null ? null : json["copyrights"],
        legs: json["legs"] == null
            ? null
            : List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        overviewPolyline: json["overview_polyline"] == null
            ? null
            : Polyline.fromJson(json["overview_polyline"]),
        summary: json["summary"] == null ? null : json["summary"],
        warnings: json["warnings"] == null
            ? null
            : List<dynamic>.from(json["warnings"].map((x) => x)),
        waypointOrder: json["waypoint_order"] == null
            ? null
            : List<dynamic>.from(json["waypoint_order"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds == null ? null : bounds!.toJson(),
        "copyrights": copyrights == null ? null : copyrights,
        "legs": legs == null
            ? null
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "overview_polyline":
            overviewPolyline == null ? null : overviewPolyline!.toJson(),
        "summary": summary == null ? null : summary,
        "warnings": warnings == null
            ? null
            : List<dynamic>.from(warnings!.map((x) => x)),
        "waypoint_order": waypointOrder == null
            ? null
            : List<dynamic>.from(waypointOrder!.map((x) => x)),
      };
}

class Bounds {
  Bounds({
    this.northeast,
    this.southwest,
  });

  Northeast? northeast;
  Northeast? southwest;

  factory Bounds.fromRawJson(String str) => Bounds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: json["northeast"] == null
            ? null
            : Northeast.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Northeast.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast!.toJson(),
        "southwest": southwest == null ? null : southwest!.toJson(),
      };
}

class Northeast {
  Northeast({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Northeast.fromRawJson(String str) =>
      Northeast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Northeast.fromJson(Map<String, dynamic> json) => Northeast(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Leg {
  Leg({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
    this.trafficSpeedEntry,
    this.viaWaypoint,
  });

  DistanceClass? distance;
  DistanceClass? duration;
  String? endAddress;
  Northeast? endLocation;
  String? startAddress;
  Northeast? startLocation;
  List<Step>? steps;
  List<dynamic>? trafficSpeedEntry;
  List<dynamic>? viaWaypoint;

  factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        distance: json["distance"] == null
            ? null
            : DistanceClass.fromJson(json["distance"]),
        duration: json["duration"] == null
            ? null
            : DistanceClass.fromJson(json["duration"]),
        endAddress: json["end_address"] == null ? null : json["end_address"],
        endLocation: json["end_location"] == null
            ? null
            : Northeast.fromJson(json["end_location"]),
        startAddress:
            json["start_address"] == null ? null : json["start_address"],
        startLocation: json["start_location"] == null
            ? null
            : Northeast.fromJson(json["start_location"]),
        steps: json["steps"] == null
            ? null
            : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        trafficSpeedEntry: json["traffic_speed_entry"] == null
            ? null
            : List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: json["via_waypoint"] == null
            ? null
            : List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance!.toJson(),
        "duration": duration == null ? null : duration!.toJson(),
        "end_address": endAddress == null ? null : endAddress,
        "end_location": endLocation == null ? null : endLocation!.toJson(),
        "start_address": startAddress == null ? null : startAddress,
        "start_location":
            startLocation == null ? null : startLocation!.toJson(),
        "steps": steps == null
            ? null
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "traffic_speed_entry": trafficSpeedEntry == null
            ? null
            : List<dynamic>.from(trafficSpeedEntry!.map((x) => x)),
        "via_waypoint": viaWaypoint == null
            ? null
            : List<dynamic>.from(viaWaypoint!.map((x) => x)),
      };
}

class DistanceClass {
  DistanceClass({
    this.text,
    this.value,
  });

  String? text;
  int? value;

  factory DistanceClass.fromRawJson(String str) =>
      DistanceClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DistanceClass.fromJson(Map<String, dynamic> json) => DistanceClass(
        text: json["text"] == null ? null : json["text"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "value": value == null ? null : value,
      };
}

class Step {
  Step({
    this.distance,
    this.duration,
    this.endLocation,
    this.htmlInstructions,
    this.polyline,
    this.startLocation,
    this.travelMode,
    this.maneuver,
  });

  DistanceClass? distance;
  DistanceClass? duration;
  Northeast? endLocation;
  String? htmlInstructions;
  Polyline? polyline;
  Northeast? startLocation;
  TravelMode? travelMode;
  String? maneuver;

  factory Step.fromRawJson(String str) => Step.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: json["distance"] == null
            ? null
            : DistanceClass.fromJson(json["distance"]),
        duration: json["duration"] == null
            ? null
            : DistanceClass.fromJson(json["duration"]),
        endLocation: json["end_location"] == null
            ? null
            : Northeast.fromJson(json["end_location"]),
        htmlInstructions: json["html_instructions"] == null
            ? null
            : json["html_instructions"],
        polyline: json["polyline"] == null
            ? null
            : Polyline.fromJson(json["polyline"]),
        startLocation: json["start_location"] == null
            ? null
            : Northeast.fromJson(json["start_location"]),
        travelMode: json["travel_mode"] == null
            ? null
            : travelModeValues.map[json["travel_mode"]],
        maneuver: json["maneuver"] == null ? null : json["maneuver"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance!.toJson(),
        "duration": duration == null ? null : duration!.toJson(),
        "end_location": endLocation == null ? null : endLocation!.toJson(),
        "html_instructions": htmlInstructions == null ? null : htmlInstructions,
        "polyline": polyline == null ? null : polyline!.toJson(),
        "start_location":
            startLocation == null ? null : startLocation!.toJson(),
        "travel_mode":
            travelMode == null ? null : travelModeValues.reverse[travelMode],
        "maneuver": maneuver == null ? null : maneuver,
      };
}

class Polyline {
  Polyline({
    this.points,
  });

  String? points;

  factory Polyline.fromRawJson(String str) =>
      Polyline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Polyline.fromJson(Map<String, dynamic> json) => Polyline(
        points: json["points"] == null ? null : json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points == null ? null : points,
      };
}

enum TravelMode { driving }

final travelModeValues = EnumValues({"DRIVING": TravelMode.driving});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
