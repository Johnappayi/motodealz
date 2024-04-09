import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),

              const SizedBox(height: MSizes.spaceBtwSections),

              ///Title and Subtitle
              Text(title,
                  textAlign: TextAlign.center,
                  style: MFonts.fontAH1),
              const SizedBox(
                height: MSizes.md,
              ),
              Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: MFonts.fontCB2b),
              const SizedBox(
                height: MSizes.md,
              ),

              ///Buttons
              LargeButtonNS(
                onPressed: onPressed,
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
