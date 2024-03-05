import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MColors.secondary,
                MColors.primary,
              ],
            ),
          ),
        ),
        Center(child: Image.asset(MImages.lightAppLogo))
      ],
    );
  }
}
