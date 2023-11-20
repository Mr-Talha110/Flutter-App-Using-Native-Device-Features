import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_features_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Native features app', style: TextStyle(color: Colors.white),),
        actions: [

          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: (){
              Get.to(const AddPlaceScreen());
            }, child: const Icon(Icons.add, color: Colors.white,),)
        ],
      ),
      body: const Center(child: Text('Places List Screen')),
    );
  }
}