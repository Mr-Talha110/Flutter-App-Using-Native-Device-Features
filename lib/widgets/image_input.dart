// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({super.key, required this.onSelectImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'Please Add Image',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
              onPressed: () async {
                final pickedImage = await ImagePicker()
                    .pickImage(source: ImageSource.camera, maxWidth: 600);
                if (pickedImage != null) {
                  setState(() {
                    _storedImage = File(pickedImage.path);
                  });
                  final appDir =
                      await syspaths.getApplicationDocumentsDirectory();
                  final fileName = path.basename(pickedImage.path);
                  final savedImage =
                      await pickedImage.saveTo('${appDir.path}/$fileName');
                  widget.onSelectImage(savedImage);
                }
              },
              icon: const Icon(
                Icons.file_copy,
                color: Colors.red,
              ),
              label: const Text(
                'Take Picture',
                style: TextStyle(color: Colors.red),
              )),
        )
      ],
    );
  }
}
