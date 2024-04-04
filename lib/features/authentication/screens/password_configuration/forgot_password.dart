import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:motodealz/features/authentication/screens/signup/create_acc.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/validators/validation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    final controller = Get.put(ForgotPasswordController());

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
                    Text("FORGOT PASSWORD", style: MFonts.fontAH1),
                    SizedBox(
                      height: MSizes.md,
                    ),
                    Text(
                        "We just need your registered email address and we are good to go",
                        textAlign: TextAlign.center,
                        style: MFonts.fontCB1),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),

              /// Form
              Form(
                key: controller.forgetPasswordFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      InputFieldWithIcon(
                        controller: controller.email,
                        label: "Email",
                        hintText: "Enter Email",
                        validator: MValidator.validateEmail,
                        prefixIcon: MImages.mailIcon,
                      ),
                      const SizedBox(height: MSizes.spaceBtwInputFields),
                      LargeButtonNS(
                        child: const Text("Send"),
                        onPressed: () => controller.sendPasswordResetEmail(),
                      ),
                      const SizedBox(height: MSizes.sm),
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
                    onPressed: () => Get.to(() => const CreateAccountScreen()),
                    child: const Text("Create Account")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
