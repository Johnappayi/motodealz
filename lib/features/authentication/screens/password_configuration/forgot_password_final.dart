import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:motodealz/features/authentication/screens/login/login.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ForgotPasswordLastScreen extends StatelessWidget {
  const ForgotPasswordLastScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {

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
                       "A password reset email has been sent. Follow instructions to reset and log in again",
                        textAlign: TextAlign.center,
                        style: MFonts.fontCB1),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),
              SizedBox(
                height: MHelperFunctions.screenHeight() * 0.6,
                child: Center(
                  child: SvgPicture.asset(MImages.forgotPasswordImg),
                ),
              ),
              LargeButtonNS(
                child: const Text("Done"),
                onPressed: () => Get.offAll(() => const LoginScreen()),
              ),
              const SizedBox(height: MSizes.nm),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    onPressed: () => ForgotPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text("Resend Email")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}