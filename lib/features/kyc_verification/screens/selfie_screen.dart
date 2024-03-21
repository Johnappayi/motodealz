import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationSelfieScreen extends StatelessWidget {
  const UserVerificationSelfieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MSizes.defaultSpace,
                  vertical: MSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // children: [ButtonContainer(child: MImages.closeIcon)],
                    ),
                    Text(
                      "KYC VERIFICATION",
                      style: MFonts.fontAH1,
                    ),
                    SizedBox(height: MSizes.spaceBtwSections),
                    Text(
                      "Take a Selfie",
                      style: MFonts.fontBH1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              const SizedBox(height: MSizes.spaceBtwSections),
              SizedBox(
                width: MHelperFunctions.screenWidth(),
                height: MHelperFunctions.screenHeight() * 0.50,
                child: Stack(
                  children: [
                    // Image background
                    //Image from camera
                    Image.asset(
                      MImages.sampleUser1,
                      width: MHelperFunctions.screenWidth(),
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Cutout Rectangle
                    CustomPaint(
                      painter: RectanglePainter(),
                      child: const Center(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.nm),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MSizes.defaultSpace,
                  vertical: MSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    LargeButtonNS(child: Text("Take a picture")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.transparent;

    // Draw outer rectangle
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );

    // Draw inner rectangle as a hole/ Ratio of a credit card
    final double holeWidth = size.width * 0.75; // Adjust as needed
    final double holeHeight = holeWidth;

    final holeSize = Size(holeWidth, holeHeight);
    const double yOffset = -20.0;
    final holeRect = Rect.fromCenter(
      center: size.center(Offset.zero) + const Offset(0, yOffset),
      width: holeSize.width,
      height: holeSize.height,
    );

    // Create a path for the outer rectangle
    final outerPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create a path for the hole
    final holePath = Path()
      ..addRRect(RRect.fromRectAndRadius(holeRect,
          const Radius.circular(25.0))); // Adjust radius for rounded corners

    // Combine paths to create the cutout effect
    final combinedPath =
        Path.combine(PathOperation.difference, outerPath, holePath);

    // Draw the combined path
    canvas.drawPath(
      combinedPath,
      Paint()..color = MColors.black.withOpacity(0.7),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
