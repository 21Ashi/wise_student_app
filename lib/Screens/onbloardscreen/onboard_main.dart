import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/onbloardscreen/screen_1.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/Screens/onbloardscreen/screen_2.dart';
import 'package:wise_student_app/Screens/onbloardscreen/screen_3.dart';
import 'package:wise_student_app/Screens/onbloardscreen/screen_4.dart';
import 'package:wise_student_app/Screens/onbloardscreen/screen_5.dart';
import 'package:wise_student_app/nav_bar.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatelessWidget {
  Onboard({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
              Screen4(),
              Screen5()
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.25),
            child: SmoothPageIndicator(
              effect: ColorTransitionEffect(
                dotHeight: 6,
                dotWidth: 6,
                dotColor: Theme.of(context).colorScheme.secondary,
              ),
              controller: _controller,
              count: 5,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.8),
            child: InkWell(
              onTap: () {
                Get.to(() => const NavBar(
                      initialIndex: 0,
                    ));
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff4B62A9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.primary,
                          offset: const Offset(0, 1))
                    ]),
                child: Center(
                    child: Text(
                  S.of(context).StartUsing,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
