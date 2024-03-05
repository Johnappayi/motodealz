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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    Text("WELCOME BACK", style: MFonts.fontAH1),
                    SizedBox(
                      height: MSizes.md,
                    ),
                    Text(
                      "Get back and find out whats new!",
                      textAlign: TextAlign.center,
                      style: MFonts.fontCB1,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: MSizes.md,
              ),

              /// Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      const InputFieldWithIcon(
                        label: "Username",
                        hintText: "Enter Username",
                        prefixIcon: MImages.profileIcon,
                      ),

                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      /// Password
                      const InputFieldWithIcon(
                        hintText: "Enter password",
                        label: 'Password',
                        prefixIcon: MImages.passwordIcon,
                        suffixIcon: MImages.eyeIcon,
                      ),

                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      const LargeButtonNS(
                        child: Text("Login"),
                      ),

                      const SizedBox(height: MSizes.sm),

                      ///Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(MTexts.rememberMe),
                            ],
                          ),

                          ///Forgot Password
                          TextButton(
                              onPressed: () {},
                              child: const Text(MTexts.forgetPassword)),
                        ],
                      ),
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
                  "Don’t have an account? ",
                  style: MFonts.fontCB1,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text("Create Account")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
