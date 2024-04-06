import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/image_carousel.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class VehicleImageViewScreen extends StatelessWidget {
  const VehicleImageViewScreen({super.key, required this.vehicleImages});
  final List<String> vehicleImages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(MSizes.lg),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonContainer(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: MImages.closeIcon,
                )
              ],
            ),
            const SizedBox(
              height: MSizes.defaultSpace,
            ),
            Expanded(child: MImageCarousel2(images: vehicleImages)),
          ],
        ),
      ),
    );
  }
}
