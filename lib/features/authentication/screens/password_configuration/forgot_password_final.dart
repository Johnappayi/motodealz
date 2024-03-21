import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ForgotPasswordLastScreen extends StatelessWidget {
  const ForgotPasswordLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Text("A password reset email has been sent. Follow instructions to reset and log in again", textAlign: TextAlign.center,
                        style: MFonts.fontCB1),
                  ],
                ),
              ),
        
              SizedBox(
                height: MHelperFunctions.screenHeight()*0.6,
                child: Center(
                  child: SvgPicture.asset(MImages.forgotPasswordImg),
                ),
              ),
              const SizedBox(
                height: MSizes.md,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                 const Text(
                  "Already have an account?",
                  style: MFonts.fontCB1,
                ),
                TextButton(onPressed: () {}, child: const Text("Login")),
              ])
            ]
          ),
        ),
      ),
    );
  
  }
}