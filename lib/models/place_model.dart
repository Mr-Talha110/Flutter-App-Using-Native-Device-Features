import 'dart:io';

import 'package:get/get.dart';

// class PlaceLocationModel extends GetxController {
//   final double latitude;
//   final double longitude;
//   final String address;
//   PlaceLocationModel(
//       {required this.address, required this.latitude, required this.longitude});
// }

class PlaceModel extends GetxController {
  final dynamic id;
  final String title;
  final String location;
  final File image;
  PlaceModel(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
