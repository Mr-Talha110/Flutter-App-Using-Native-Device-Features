import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_features_app/getx_data/great_places_getter.dart';
import 'package:native_features_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController titleController = TextEditingController();
  File? _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Get.put(GreatPlacesGetter()).addPlace(titleController.text, _pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: const Text(
          'Add Places',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(height: 10),
                  ImageInput(onSelectImage: _selectImage),
                ],
              ),
            ),
            ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 20))),
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
