import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanID extends StatefulWidget {
  const ScanID({super.key});

  @override
  State<ScanID> createState() => _myGalleryState();
}

// ignore: camel_case_types
class _myGalleryState extends State<ScanID> {
  // ignore: unused_field
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
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
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xff4B62A9),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
