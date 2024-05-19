import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activeIndex = 0;

  List urImages = [
    {"id": 1, "image_path": 'assets/pic1.png'},
    {"id": 2, "image_path": 'assets/pic2.png'},
    {"id": 3, "image_path": 'assets/pic3.png'}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CarouselSlider(
            items: urImages
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                height: 300),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        buildIndicator(),
      ],
    ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: ColorTransitionEffect(
        dotHeight: 6,
        dotWidth: 6,
        dotColor: Theme.of(context).colorScheme.secondary,
      ),
      activeIndex: activeIndex,
      count: urImages.length);
}
