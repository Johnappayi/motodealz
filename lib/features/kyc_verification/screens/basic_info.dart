import 'package:flutter/material.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';

class UserVerificationInfoScreen extends StatelessWidget {
  const UserVerificationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool darkMode = MHelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // children: [ButtonContainer(child: MImages.closeIcon)],
              ),
              Text(
                "KYC VERIFICATION",
                style: MFonts.fontAH1,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              Text(
                "Basic Info",
                style: MFonts.fontBH1,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              Form(
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
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              LargeButton(child: Text("Continue"))
            ],
          ),
        )),
      ),
    );
  }
}
