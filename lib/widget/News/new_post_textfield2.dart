// ignore: depend_on_referenced_packages
import 'dart:io';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/News/gallery_button.dart';
// ignore: unused_import

import '../TextFields/custom_animate_border.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewPostTextField2 extends StatefulWidget {
  final String label;
  final Widget? suffix;
  NewPostTextField2({Key? key, required this.label, required this.suffix})
      : super(key: key);
  // ignore: unused_field
  File? _selectImage;

  @override
  State<NewPostTextField2> createState() => _AnimatedTextFieldState2();
}

class _AnimatedTextFieldState2 extends State<NewPostTextField2>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    // controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Theme(
        data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xff4B62A9),
                )),
        child: CustomPaint(
          painter: CustomAnimateBorder(alpha.value),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextField(
                  maxLines: 5,
                  minLines: 1,
                  enabled: true,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: S.of(context).NewPostDescription,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                    ),
                  ),
                  style: const TextStyle(),
                ),
              ),
              const Positioned(
                bottom: 10.0,
                right: 7.0,
                child: Row(
                  children: [
                    myGallery(),
                    SizedBox(width: 8.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
