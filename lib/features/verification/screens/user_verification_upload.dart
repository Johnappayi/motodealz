import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class UserVerificationUploadScreen extends StatelessWidget {
  const UserVerificationUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool darkMode = MHelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ButtonContainer(child: MImages.closeIcon)],
              ),
              Text(
                "KYC VERIFICATION",
                style: MFonts.fontAH1,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              Text(
                "We are almost there",
                style: MFonts.fontBH1,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("Choose a method to submit your ID", style: MFonts.fontCH4,),
                  SizedBox(height: MSizes.spaceBtwSections,),
                  LargeButton(child: Text("Take a picture")),
                  SizedBox(
                    height: MSizes.spaceBtwItems,
                  ),
                  LargeSecButton(child: Text("Upload")),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
