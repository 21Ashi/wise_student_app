import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class myGallery extends StatefulWidget {
  const myGallery({super.key});

  @override
  State<myGallery> createState() => _myGalleryState();
}

// ignore: camel_case_types
class _myGalleryState extends State<myGallery> {
  // ignore: unused_field
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image != null
              ? Image.file(
                  _image!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/box.png'),
          const SizedBox(
            width: 240,
          ),
          InkWell(
              onTap: getImage,
              child: Icon(Icons.photo,
                  color: Theme.of(context).colorScheme.secondary)),
        ],
      ),
    );
  }
}
