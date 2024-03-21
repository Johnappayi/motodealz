import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class VehicleVerificationLastScreen extends StatelessWidget {
  const VehicleVerificationLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // children: [ButtonContainer(child: MImages.closeIcon)],
              ),
              const Text(
                "THANK YOU!",
                style: MFonts.fontAH1,
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const Padding(
                padding: EdgeInsets.all(MSizes.defaultSpace),
                child: Text(
                  "Your ad will go live once we verify the details",
                  style: MFonts.fontCH4,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
            
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
                child: SvgPicture.asset(MImages.verifyImg5),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const LargeButton(child: Text("Continue"))
            ],
          ),
        )),
      ),
    );
  }
}
