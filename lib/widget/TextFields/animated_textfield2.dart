// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:wise_student_app/generated/l10n.dart';

import 'custom_animate_border.dart';
import 'package:flutter/material.dart';

class AnimatedTextField2 extends StatefulWidget {
  final String label;
  final Widget? suffix;
  const AnimatedTextField2(
      {super.key, required this.label, required this.suffix});

  @override
  State<AnimatedTextField2> createState() => _AnimatedTextFieldState2();
}

class _AnimatedTextFieldState2 extends State<AnimatedTextField2>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  bool securePassword = true;
  bool termAndCondtion = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final Animation<double> curve =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

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
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.number,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: S.of(context).Password,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: widget.suffix,
            ),
          ),
        ),
      ),
    );
  }
}
