import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MImageCarousel extends StatefulWidget {
  const MImageCarousel({super.key});

  @override
  State<MImageCarousel> createState() => _MImageCarouselState();
}

class _MImageCarouselState extends State<MImageCarousel> {
  final items = [
    MImages.sampleCar1,
    MImages.sampleCar2,
    MImages.sampleCar3,
    MImages.sampleCar4,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        CarouselSlider(
          items: items.map((String imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: MHelperFunctions.screenHeight() * 0.45,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MHelperFunctions.screenHeight() * 0.08, // Adjust as needed
          child: Center(
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                spacing: EdgeInsets.all(4),
                size: const Size.square(8.0),
                activeSize: const Size(24.0, 8.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: darkMode
                    ? MColors.surfaceDark
                    : MColors.surface,
                activeColor: darkMode ? MColors.secondary : MColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
