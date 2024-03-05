import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
                child: Column(
                  children: [
                    Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
                    Text("Let’s get started", style: MFonts.fontAH1),
                    SizedBox(
                      height: MSizes.md,
                    ),
                    Text("Create an account to buy or sell your used vehicles", textAlign: TextAlign.center,
                        style: MFonts.fontCB1),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),

              /// Form
              const Form(
                child: Padding(
                  padding: EdgeInsets.only(top: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      InputFieldWithIcon(
                        label: "Username",
                        hintText: "Enter Username",
                        prefixIcon: MImages.profileIcon,
                      ),

                      SizedBox(height: MSizes.spaceBtwInputFields),

                      InputFieldWithIcon(
                        label: "Email",
                        hintText: "Enter Email",
                        prefixIcon: MImages.mailIcon,
                      ),

                      SizedBox(height: MSizes.spaceBtwInputFields),

                      /// Password
                      InputFieldWithIcon(
                        hintText: "Enter password",
                        label: 'Password',
                        prefixIcon: MImages.passwordIcon,
                        suffixIcon: MImages.eyeIcon,
                      ),

                      SizedBox(height: MSizes.spaceBtwInputFields),

                      LargeButtonNS(
                        child: Text("Create account"),
                      ),

                      SizedBox(height: MSizes.sm),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? MColors.darkGrey : MColors.lightGrey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(MTexts.or,
                      style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                    child: Divider(
                      color: dark ? MColors.darkGrey : MColors.lightGrey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  )
                ],
              ),

              const SizedBox(height: MSizes.spaceBtwSections),

              const LargeSecButtonWithIcon(
                icon: MImages.google,
                child: Text(
                  "Continue with google",
                  style: MFonts.fontCB1,
                ),
              ),

              const SizedBox(height: MSizes.nm),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account?",
                  style: MFonts.fontCB1,
                ),
                TextButton(onPressed: () {}, child: const Text("Login")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
