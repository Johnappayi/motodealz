import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
            child: Column(children: [
              ///Image
              Image(
                  image: AssetImage(MImages.verificationScreenImage),
                  width: MHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///Title and Subtitle
              const Text("Verify your Email!", style: MFonts.fontAH1),
              const SizedBox(
                height: MSizes.md,
              ),
              Text(email ?? '',
                  textAlign: TextAlign.center, style: MFonts.fontCB2b),
              const SizedBox(
                height: MSizes.md,
              ),
              const Text(
                  "Congratulations! You are just one step away from starting your journey with us. Kindly verify your email to continue.",
                  textAlign: TextAlign.center,
                  style: MFonts.fontCB1),
              const SizedBox(
                height: MSizes.md,
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
            ])),
      ),
    );
  }
}
