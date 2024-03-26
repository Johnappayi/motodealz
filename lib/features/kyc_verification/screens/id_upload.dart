import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/widgets/back_button.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/features/kyc_verification/screens/uploaded_id.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
// import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationUploadScreen extends StatelessWidget {
  const UserVerificationUploadScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [MBackButton()],
              ),
              const Text(
                "KYC VERIFICATION",
                style: MFonts.fontAH1,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              SvgPicture.asset(MImages.progressBar3),
              const SizedBox(
                height: MSizes.defaultSpace,
              ),
              const Text(
                "Upload ID Card",
                style: MFonts.fontBH1,
              ),
              
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
                  const SelectFile(),
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
                  const SelectFile(),
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
                   LargeButtonNS(child: const Text("Verify"),onPressed: () =>  MHelperFunctions.navigateToScreen(context, const UserVerificationUploadedIDScreen()),),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
