import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/authentication/screens/login/login.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class SignUpPromptScreen extends StatelessWidget {
  const SignUpPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
                child: Column(
                  children: [
                    Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
                    Text("HAVEN’T SINGED IN?", style: MFonts.fontAH1),
                    SizedBox(
                      height: MSizes.md,
                    ),
                    Text(
                      "Oops it seems like you havent siged in yet login now!",
                      textAlign: TextAlign.center,
                      style: MFonts.fontCB1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
                child: SvgPicture.asset(MImages.signInPrompt),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              LargeButtonNS(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                child: const Text(
                  "Login now",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
