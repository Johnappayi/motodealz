import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class ForgotPasswordOTPScreen extends StatelessWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkmode = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Column(
                children: [
                  Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
                  Text("VERIFICATION",
                      textAlign: TextAlign.center, style: MFonts.fontAH1),
                  SizedBox(
                    height: MSizes.md,
                  ),
                  Text(
                    "Enter the verification code we just send you",
                    textAlign: TextAlign.center,
                    style: MFonts.fontCB1,
                  ),
                ],
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
                      OTPTextField(
                        length: 4,
                        width: MHelperFunctions.screenWidth() * 0.85,
                        fieldWidth: 80,
                        style: MFonts.fontBH1,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor:
                              darkmode ? MColors.secondary : MColors.primary,
                          focusBorderColor:
                              darkmode ? MColors.secondary : MColors.primary,
                        ),
                        onCompleted: (pin) {
                          // print("Completed: " + pin);
                        },
                      ),
                      const SizedBox(height: MSizes.spaceBtwInputFields),
                      const LargeButtonNS(
                        child: Text("Confirm"),
                      ),
                      const SizedBox(height: MSizes.sm),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: MSizes.nm),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "If you didn’t receive a code!",
                  style: MFonts.fontCB1,
                ),
                TextButton(onPressed: () {}, child: const Text("Resend")),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
