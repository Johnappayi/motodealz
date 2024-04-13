import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/button_container.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationLastScreen extends StatelessWidget {
  const UserVerificationLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool darkMode = MHelperFunctions.isDarkMode(context);
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop:  () async {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonContainer(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MImages.closeIcon,
                      )
                    ],
                  ),
                const Text(
                  "KYC VERIFICATION",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const Text(
                  "Thank you",
                  style: MFonts.fontBH1,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const Padding(
                  padding: EdgeInsets.all(MSizes.defaultSpace),
                  child: Text(
                    "Thats all we need to start verifying your identity",
                    style: MFonts.fontCH4,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
                  child: SvgPicture.asset(MImages.verifyImg4),
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                 LargeButton(child: const Text("Continue"),onPressed: () => MHelperFunctions.navigateToScreen(context, const NavigationMenu()),)
              ],
            ),
          )),
        ),
      ),
    );
  }
  void _handleBackButton(BuildContext context) {
    // Handle custom back navigation
    Get.offAll(() => const NavigationMenu());
  }
}
