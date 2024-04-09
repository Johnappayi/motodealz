// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/kyc_verification/screens/final_screen.dart';
import 'package:motodealz/features/kyc_verification/screens/upload_choice.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationUploadedIDScreen extends StatelessWidget {
  const UserVerificationUploadedIDScreen(
      {super.key, required this.imageFrontPath, required this.imageBackPath});
  final String imageFrontPath;
  final String imageBackPath;
  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async { 
         // Handle back button press
      _handleBackButton(context);
      // Prevent default back button behavior
      return false;
       },
      child: Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonContainer(
                        onPressed: () {
                          Get.offAll(
                              () => const UserVerificationUploadChoiceScreen());
                        },
                        child: MImages.backIcon)
                  ],
                ),
                const Text(
                  "KYC VERIFICATION",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(
                  height: MSizes.spaceBtwSections,
                ),
                SvgPicture.asset(
                  MImages.progressBar3,
                  colorFilter: MSvgStyle.svgStyle3(darkMode),
                ),
                const SizedBox(
                  height: MSizes.defaultSpace,
                ),
                // const Text(
                //   "Uploaded ID Card",
                //   style: MFonts.fontBH1,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Front side",
                      style: MFonts.fontCH4,
                    ),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    SizedBox(
                      width: MHelperFunctions.screenWidth(),
                      height: MHelperFunctions.screenWidth() / 2.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(imageFrontPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: MSizes.defaultSpace,
                    ),
                    const Text(
                      "Back side",
                      style: MFonts.fontCH4,
                    ),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    SizedBox(
                      width: MHelperFunctions.screenWidth(),
                      height: MHelperFunctions.screenWidth() / 2.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(imageBackPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: MSizes.sm,
                    ),
                    Text(
                      "Please ensure that the provided images are clear and visible",
                      style: MFonts.fontCB2.copyWith(color: MColors.lightGrey),
                    ),
                    const SizedBox(
                      height: MSizes.defaultSpace,
                    ),
                    LargeButtonNS(
                      child: const Text("Verify"),
                      onPressed: () => MHelperFunctions.navigateToScreen(
                          context, const UserVerificationLastScreen()),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
void _handleBackButton(BuildContext context) {
  // Handle custom back navigation
  Get.offAll(() => const UserVerificationUploadChoiceScreen());
}
}
