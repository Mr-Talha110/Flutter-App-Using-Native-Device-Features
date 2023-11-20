// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: storedImage != null
              ? Image.file(
                  storedImage!,
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
              onPressed: () {},
              icon: const Icon(
                Icons.camera,
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
