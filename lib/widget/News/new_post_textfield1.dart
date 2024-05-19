// ignore: depend_on_referenced_packages
import 'package:wise_student_app/generated/l10n.dart';

import '../TextFields/custom_animate_border.dart';
import 'package:flutter/material.dart';

class NewPostTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;
  const NewPostTextField({Key? key, required this.label, required this.suffix})
      : super(key: key);

  @override
  State<NewPostTextField> createState() => _AnimatedTextFieldState2();
}

class _AnimatedTextFieldState2 extends State<NewPostTextField>
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
      height: 50,
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
          child: TextField(
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: S.of(context).NewPostTitle,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ),
    );
  }
}
