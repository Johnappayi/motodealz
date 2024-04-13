import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ReportIssuePage extends StatelessWidget {
  const ReportIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: MSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: MSizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MBackButton(),
                      Image.asset(
                        darkMode ? MImages.appBarLogoL : MImages.appBarLogoD,
                        width: MHelperFunctions.screenWidth() * 0.31,
                      ),
                      SizedBox(
                        width: MHelperFunctions.screenWidth() * 0.1,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
                  child: Column(
                    children: [
                      Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
                      Text("REPORT A BUG ", style: MFonts.fontAH1),
                      SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                      Text(
                        "Kindly provide a clear and concise descriptions of the bug, including what actions led to its occurrence and the expected versus actual behavior.",
                        textAlign: TextAlign.center,
                        style: MFonts.fontCB1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const InputField(
                  hintText: 'Describe the bug here...',
                  label: '',
                ),
                const SizedBox(height: MSizes.nm),
                LargeButtonNS(
                  onPressed: () => Get.offAll(const NavigationMenu()),
                  child: const Text('Submit Bug'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
