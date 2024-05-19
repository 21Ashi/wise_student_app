import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            Container(
              height: 130,
              width: 150,
              decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(18)),
            ),     
        ]
        );
  }
}