// import 'package:dio/dio.dart';
// import 'package:verst/directions/g_api.dart';
// import 'package:verst/directions/model_distance.dart';

// class DistanceService {
//   // ignore: unused_field
//   static const String _baseUrl =
//       "https://maps.googleapis.com/maps/api/directions/json?";
//   Dio? _dio;
//   DistanceService({Dio? dio}) : _dio = dio ?? Dio();

//   Future<Distance> getDistance({
//     @required LatLng origin,
//     @required LatLng destination,
//   }) async {
//     final response = await _dio?.get(
//       _baseUrl,
//       queryParameters: {
//         'origin': '${origin.latitude},${origin.longitude}',
//         'destination': '${destination.latitude},${destination.longitude}',
//         'key': googleAPIKey,
//       },
//     );
//     if(response?.statusCode ==200){
//       return Distance.fromMap(response?.data);
//     }
//     return null;
//   }
// }
