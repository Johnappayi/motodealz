import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleVeiwScreen extends StatelessWidget {
  const VehicleVeiwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              MImages.sampleCar1,
              fit: BoxFit.cover,
              width: MHelperFunctions.screenWidth(),
              height: MHelperFunctions.screenHeight() * 0.45,
            ), //Later change this to carousel
            const MyDraggableSheet(
              child: Column(
                children: [
                  VehicleDetailsUI(),
                  SizedBox(
                    height: 90,
                  ) //Dont remove this
                ],
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(MSizes.lg),
            //   child: Positioned(
            //     top: 0,
            //     left: 0,
            //     child: ButtonContainer(child: MImages.backIcon),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MHelperFunctions.screenWidth(),
                padding: const EdgeInsets.all(MSizes.lg),
                decoration: BoxDecoration(
                    color: darkMode ? MColors.black : MColors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. 4,90,000",
                      style: MFonts.fontCH1,
                    ),
                    SmallButton(child: Text("Chat"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VehicleDetailsUI extends StatelessWidget {
  const VehicleDetailsUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: Column(
        children: [
          const Text(
            "Vehicle Name",
            style: MFonts.fontBH1,
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "2010",
                style: MFonts.fontCH3,
              ),
              Text(
                "|",
                style: const TextStyle().copyWith(color: MColors.primary2Light),
              ),
              const Text(
                "Petrol",
                style: MFonts.fontCH3,
              ),
              const Text("|"),
              const Text(
                "Manual",
                style: MFonts.fontCH3,
              ),
              const Text("|"),
              const Text(
                "1,28,052km",
                style: MFonts.fontCH3,
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(MImages.ownershipIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.sm),
                  const Text(
                    "1st Owner",
                    style: MFonts.fontCB2b,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Statuee....",
                    style: MFonts.fontCB2b,
                  ),
                  const SizedBox(width: MSizes.sm),
                  SvgPicture.asset(MImages.locationIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.nm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Posted on 12/08/2023",
                  style: MFonts.fontCB3.copyWith(color: MColors.lightGrey)),
              Text("Ad ID: 09982792",
                  style: MFonts.fontCB3.copyWith(color: MColors.lightGrey)),
            ],
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          const Row(
            children: [
              Text(
                "Description",
                style: MFonts.fontCH4,
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.sm,
          ),
          Container(
            decoration: BoxDecoration(
                color: darkMode ? MColors.surfaceDark : MColors.surface,
                borderRadius: BorderRadius.circular(MSizes.cardRadiusLg)),
            padding: const EdgeInsets.all(MSizes.md),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toyota Innova for sale",
                  style: MFonts.fontCB2b,
                ),
                SizedBox(
                  height: MSizes.sm,
                ),
                Text(
                  "March 2010 Innova Auto, Single Owner, MH 01 Reg, 48k kms, Silver/Beige, Flawless, 4 New Tires, Unused Spare, 2 Keys, 5Yr Finance Available.",
                  style: MFonts.fontCB2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
