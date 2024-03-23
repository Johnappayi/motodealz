import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/authentication/controllers/signup/signup_controller.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/validators/validation.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    final signUpController = Get.put(SignUpController()); // Bind the controller

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
                    Text("Create an account to buy or sell your used vehicles",
                        textAlign: TextAlign.center, style: MFonts.fontCB1),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),

              /// Form
              Form(
                key: signUpController.signUpFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      InputFieldWithIcon(
                        label: "Username",
                        hintText: "Enter Username",
                        prefixIcon: MImages.profileIcon,
                        controller: signUpController.username,
                        validator: (value) =>
                            MValidator.validateUsername(value),
                      ),

                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      InputFieldWithIcon(
                        label: "Email",
                        hintText: "Enter Email",
                        prefixIcon: MImages.mailIcon,
                        controller: signUpController.email,
                        validator: (value) => MValidator.validateEmail(value),
                      ),

                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      /// Password
                      Obx(
                        () => InputFieldWithIcon(
                          hintText: "Enter password",
                          label: "Password",
                          prefixIcon: MImages.passwordIcon,
                          suffixIcon: signUpController.hidePassword.value
                              ? MImages.eyeIcon
                              : MImages.eyeClosedIcon,
                          controller: signUpController.password,
                          obscureText: signUpController.hidePassword.value,
                          validator: (value) =>
                              MValidator.validatePassword(value),
                          onSuffixIconPressed: () {
                            // Perform your action here
                            signUpController.hidePassword.value =
                                !signUpController.hidePassword.value;
                            // print('Suffix icon pressed');
                            // print(signUpController.hidePassword.value);
                          },
                        ),
                      ),

                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      LargeButtonNS(
                        child: const Text("Create account"),
                        onPressed: () => signUpController.signup(),
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
