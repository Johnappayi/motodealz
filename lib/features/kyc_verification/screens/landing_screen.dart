import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationStartScreen extends StatelessWidget {
  const UserVerificationStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
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
                  "KYC VERIFICATION",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(
                  height: MSizes.md,
                ),
                const Text(
                  "Verify your identity in 3 Easy steps",
                  style: MFonts.fontCB1,
                ),
                const SizedBox(
                  height: MSizes.spaceBtwSections,
                ),
                Container(
                  padding: const EdgeInsets.all(MSizes.md),
                  width: MHelperFunctions.screenWidth() * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: MColors.outline, width: 1),
                      color: darkMode ? MColors.surfaceDark : MColors.surface,
                      borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
                  child: Column(children: [
                    SvgPicture.asset(MImages.verifyImg1),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    Text(
                      "Step 1 : Basic Info",
                      style: MFonts.fontBH1.copyWith(color: MColors.lightGrey),
                    )
                  ]),
                ),
                const SizedBox(
                  height: MSizes.nm,
                ),
                Container(
                  padding: const EdgeInsets.all(MSizes.md),
                  width: MHelperFunctions.screenWidth() * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: MColors.outline, width: 1),
                      color: darkMode ? MColors.surfaceDark : MColors.surface,
                      borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
                  child: Column(children: [
                    SvgPicture.asset(MImages.verifyImg2),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    Text(
                      "Step 2 : Take Selfie",
                      style: MFonts.fontBH1.copyWith(color: MColors.lightGrey),
                    )
                  ]),
                ),
                const SizedBox(
                  height: MSizes.nm,
                ),
                Container(
                  padding: const EdgeInsets.all(MSizes.md),
                  width: MHelperFunctions.screenWidth() * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: MColors.outline, width: 1),
                      color: darkMode ? MColors.surfaceDark : MColors.surface,
                      borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
                  child: Column(children: [
                    SvgPicture.asset(MImages.verifyImg3),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    Text(
                      "Step 3 : Submit ID Card",
                      style: MFonts.fontBH1.copyWith(color: MColors.lightGrey),
                    )
                  ]),
                ),
                const SizedBox(
                  height: MSizes.spaceBtwSections,
                ),
                const LargeButton(child: Text("Get started"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
