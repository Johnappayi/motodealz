import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/features/authentication/controllers/email_verification/verify_email_controller.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: MSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                 Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonContainer(
                              onPressed: () =>
                                  AuthenticationRepository.instance.logout(),
                              child: MImages.closeIcon),
                        ],
                      ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MSizes.sm,
                      ),
                      Text("VERIFY YOUR EMAIL", style: MFonts.fontAH1),
                      SizedBox(
                        height: MSizes.md,
                      ),
                      Text(
                          "Congratulations! You are just a step away. Kindly verify your email to continue.",
                          textAlign: TextAlign.center,
                          style: MFonts.fontCB1),
                    ],
                  ),
                ),
                const SizedBox(
                  height: MSizes.md,
                ),
                SizedBox(
                  height: MHelperFunctions.screenHeight() * 0.55,
                  child: Center(
                    child: SvgPicture.asset(MImages.verificationScreenImage),
                  ),
                ),

                ///Buttons
                LargeButtonNS(
                  child: const Text("Continue"),
                  onPressed: () =>
                      Get.to(() => controller.checkEmailVerificationStatus()),
                ),
                const SizedBox(
                  height: MSizes.md,
                ),
                TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text("Resend Email")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
