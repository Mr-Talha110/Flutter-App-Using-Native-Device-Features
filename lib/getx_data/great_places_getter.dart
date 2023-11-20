import 'dart:io';

import 'package:get/get.dart';
import 'package:native_features_app/models/place_model.dart';

class GreatPlacesGetter extends GetxController {
  final _items = <PlaceModel>[].obs;
  List<PlaceModel> get items {
    return [..._items].obs;
  }

  void addPlace(String title, File image) {
    final newPlace = PlaceModel(
        id: DateTime.now(), title: title, location: '', image: image);
    items.add(newPlace);
  }
}
