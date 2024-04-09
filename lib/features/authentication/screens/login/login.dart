import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/authentication/controllers/login/login_controller.dart';
import 'package:motodealz/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:motodealz/features/authentication/screens/signup/create_acc.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
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
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      InputFieldWithIcon(
                        label: "Email",
                        hintText: "Enter Email",
                        prefixIcon: MImages.profileIcon,
                        controller: controller.email,
                        validator: (value) => MValidator.validateEmail(value),
                      ),

                      const SizedBox(height: MSizes.xs),

                      /// Password
                      Obx(
                        () => InputFieldWithIcon(
                          hintText: "Enter password",
                          label: "Password",
                          prefixIcon: MImages.passwordIcon,
                          suffixIcon: controller.hidePassword.value
                              ? MImages.eyeIcon
                              : MImages.eyeClosedIcon,
                          controller: controller.password,
                          obscureText: controller.hidePassword.value,
                          validator: (value) =>
                              MValidator.validateEmptyText('Password', value),
                          onSuffixIconPressed: () {
                            // Perform your action here
                            controller.hidePassword.value =
                                !controller.hidePassword.value;
                            // print('Suffix icon pressed');
                            // print(controller.hidePassword.value);
                          },
                        ),
                      ),
                      

                      
                      ///Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Remember Me
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) => controller.rememberMe
                                        .value = !controller.rememberMe.value),
                              ),
                              const Text(MTexts.rememberMe),
                            ],
                          ),

                          ///Forgot Password
                          TextButton(
                              onPressed: () => Get.to(
                                  () => const ForgotPasswordScreen()),
                              child: const Text(MTexts.forgetPassword)),
                        ],
                      ),

                      const SizedBox(height: MSizes.xs),

                      LargeButtonNS(
                        child: const Text("Login"),
                        onPressed: () => controller.emailAndPasswordSignIn(),
                      ),

                      const SizedBox(height: MSizes.sm),

                    ],
                  ),
                ),
              ),
const SizedBox(height: MSizes.xs),
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

              const SizedBox(height: MSizes.sm),

              LargeSecButtonWithIcon(
                icon: MImages.google,
                child: const Text(
                  "Continue with google",
                  style: MFonts.fontCB1,
                ),
                onPressed: () => controller.googleSignIn(),
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
