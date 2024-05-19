
import 'package:flutter/material.dart';
// ignore: unused_import
import 'animated_textfield.dart';
// ignore: duplicate_import

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  CustomAnimateBorder(this.animationPercent);
  @override
  void paint(Canvas canvas, Size size) {
   

    var path = Path();
    path.moveTo(0, size.height / 2);

    path.lineTo(0, 8);
    path.quadraticBezierTo(0, 0, 8, 0);
    path.lineTo(size.width - 8, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 8);
    path.lineTo(size.width, size.height / 2);

    var path2 = Path();
    path2.moveTo(0, size.height / 2);

    path2.lineTo(0, size.height - 8);
    path2.quadraticBezierTo(0, size.height, 8, size.height);
    path2.lineTo(size.width - 8, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 8);
    path2.lineTo(size.width, size.height / 2);


   
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
