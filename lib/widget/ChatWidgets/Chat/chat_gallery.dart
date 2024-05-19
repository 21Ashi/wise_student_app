import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatGallery extends StatefulWidget {
  const ChatGallery({super.key});

  @override
  State<ChatGallery> createState() => _myGalleryState();
}

// ignore: camel_case_types
class _myGalleryState extends State<ChatGallery> {
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
    return Row(
      children: [
        InkWell(
            onTap: getImage,
            child: const Icon(
              Icons.photo,
              color: Colors.black,
            )), // Replace 'icon1' with your desired icon
      ],
    );
  }
}
