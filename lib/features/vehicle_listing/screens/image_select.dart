import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/features/vehicle_listing/screens/final_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

import '../../../common/widgets/selected_image_gallery.dart';

class VehicleImageSelectScreen extends StatelessWidget {
const VehicleImageSelectScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonContainer(
                      onPressed: () {
                        Get.offAll(const NavigationMenu());
                      },
                      child: MImages.closeIcon,
                    )
                  ],
                ),
              const Text(
                "VEHICLE IMAGE",
                style: MFonts.fontAH1,
              ),
              const SizedBox(
                height: MSizes.defaultSpace,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload photos",
                    style: MFonts.fontCH4,
                  ),
                  SizedBox(
                    height: MSizes.sm,
                  ),
                  SelectFile()
                ],
              ),
              const SizedBox(height: MSizes.nm),
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
              const SizedBox(height: MSizes.nm),
              const LargeSecButton(
                child: Text(
                  "Take a picture",
                  style: MFonts.fontCB1,
                ),
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
             
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selected photos",
                    style: MFonts.fontCH4,
                  ),
                  SizedBox(
                    height: MSizes.sm,
                  ),
                  SelectedImageGallery()
                ],
              ),
               const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
               LargeButtonNS(child: const Text("Upload"),onPressed: () => MHelperFunctions.navigateToScreen(context, const VehicleVerificationLastScreen()),)
            ],
          ),
        )),
      ),
    );
  }
}
