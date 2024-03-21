import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
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

