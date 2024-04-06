import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/kyc_verification/screens/selfie_screen.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationInfoScreen extends StatelessWidget {
  const UserVerificationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode =MHelperFunctions.isDarkMode(context);
    return  Scaffold(
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
              SvgPicture.asset(MImages.progressBar1,colorFilter: MSvgStyle.svgStyle3(darkMode),),
              const SizedBox(
                height: MSizes.defaultSpace,
              ),
      
              const Text(
                "Basic Info",
                style: MFonts.fontBH1,
              ),
              const SizedBox(
                height: MSizes.nm,
              ),
               const Form(
                child: Column(
                  children: [
                    InputField(
                      label: MTexts.firstName,
                      hintText: "Enter first name",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: MTexts.lastName,
                      hintText: "Enter last name",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputFieldWithIcon(
                      label: "Date of Birth",
                      hintText: "DD/MM/YYYY",
                      suffixIcon: MImages.calenderIcon,
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Residential Address",
                      hintText: "Enter permanent address",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Postal Code",
                      hintText: "Enter postal code",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              LargeButtonNS(onPressed: () => MHelperFunctions.navigateToScreen(context, const UserVerificationSelfieScreen()), child: const Text("Continue"))
            ],
          ),
        )),
      ),
    );
  }
}
