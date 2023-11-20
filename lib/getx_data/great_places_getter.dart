import 'package:get/get.dart';
import 'package:native_features_app/models/place_model.dart';

class GreatPlacesGetter extends GetxController{
  final _items= <PlaceModel>[
  ];
  List<PlaceModel> get items{
    return [..._items];
  }
} 