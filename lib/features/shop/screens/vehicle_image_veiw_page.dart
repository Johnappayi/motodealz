import 'package:flutter/material.dart';
// import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleImageViewScreen extends StatelessWidget {
  const VehicleImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(MSizes.lg),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ButtonContainer(child:MImages.closeIcon,)
              ],
            ),
            Image.asset(
              MImages.sampleCar1,
              fit: BoxFit.fitWidth,
              width: MHelperFunctions.screenWidth()* 0.8855,
              height: MHelperFunctions.screenHeight() * 0.7276,
            ), 
          ],
        ),
      ),
    );
  }
}
