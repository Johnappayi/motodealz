import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/image_select.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleListingInfoScreen extends StatelessWidget {
  const VehicleListingInfoScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    // final bool darkMode = MHelperFunctions.isDarkMode(context);
    return  Scaffold(
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
                "SELL YOUR CAR",
                style: MFonts.fontAH1,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
               const Form(
                child: Column(
                  children: [
                    InputField(
                      label: "Brand",
                      hintText: "Enter brand name",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Model",
                      hintText: "Enter the model",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Year",
                      hintText: "Enter the make year",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Color",
                      hintText: "Enter the color",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "KM driven",
                      hintText: "Enter total KMs driven",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "No. of Owners",
                      hintText: "Enter no. of owners",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Ad title",
                      hintText: "Enter an ad title",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Description",
                      hintText: "Describe the details of your vehicle",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "Registeration no.",
                      hintText: "Enter the licence plate number ",
                    ),
                    SizedBox(
                      height: MSizes.spaceBtwInputFields,
                    ),
                    InputField(
                      label: "VIN Number",
                      hintText: "Enter the vehicle identification number",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
               LargeButtonNS(child: const Text("Continue") ,onPressed: () => MHelperFunctions.navigateToScreen(context, const VehicleImageSelectScreen()),)
            ],
          ),
        )),
      ),
    );
  }
}
