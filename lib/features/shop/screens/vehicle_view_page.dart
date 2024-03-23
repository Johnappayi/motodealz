import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
import 'package:motodealz/features/shop/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

import '../../../common/widgets/image_carousel.dart';

class VehicleVeiwScreen extends StatelessWidget {
  const VehicleVeiwScreen({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
             const MImageCarousel(),
            MyDraggableSheet(
              child: Column(
                children: [
                  VehicleDetailsUI(vehicle: vehicle),
                  const SizedBox(
                    height: 90,
                  ) //Dont remove this
                ],
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(MSizes.lg),
                child: MBackButton(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MHelperFunctions.screenWidth(),
                padding: const EdgeInsets.all(MSizes.lg),
                decoration: BoxDecoration(
                    color: darkMode ? MColors.black : MColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MFormatter.formatCurrency(vehicle.price),
                      style: MFonts.fontCH1,
                    ),
                    const SmallButton(child: Text("Chat"))
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
