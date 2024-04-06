import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MImageCarousel1 extends StatefulWidget {
  const MImageCarousel1({
    super.key,
     required this.images,
  });

  final List<String> images;

  @override
  State<MImageCarousel1> createState() => _MImageCarousel1State();
}

class _MImageCarousel1State extends State<MImageCarousel1> {
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        CarouselSlider(
          items: widget.images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  image,
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
              dotsCount: widget.images.length,
              position: currentIndex.toInt(),
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(MSizes.xs),
                size: const Size.square(MSizes.sm),
                activeSize: const Size(MSizes.lg, MSizes.sm),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MSizes.borderRadiusSm)),
                color: darkMode ? MColors.surfaceDark : MColors.surface,
                activeColor: darkMode ? MColors.secondary : MColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class MImageCarousel2 extends StatefulWidget {
  const MImageCarousel2({
    super.key,
     required this.images,
  });

  final List<String> images;

  @override
  State<MImageCarousel2> createState() => _MImageCarousel2State();
}

class _MImageCarousel2State extends State<MImageCarousel2> {
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        CarouselSlider(
          items: widget.images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: MHelperFunctions.screenHeight() *  0.7276,
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
          bottom: MHelperFunctions.screenHeight() * 0.01, // Adjust as needed
          child: Center(
            child: DotsIndicator(
              dotsCount: widget.images.length,
              position: currentIndex.toInt(),
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(MSizes.xs),
                size: const Size.square(MSizes.sm),
                activeSize: const Size(MSizes.lg, MSizes.sm),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MSizes.borderRadiusSm)),
                color: darkMode ? MColors.surfaceDark : MColors.surface,
                activeColor: darkMode ? MColors.secondary : MColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
