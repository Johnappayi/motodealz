import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleVerificationIdCaptureScreen extends StatelessWidget {
  const VehicleVerificationIdCaptureScreen({Key? key}) : super(key: key);

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
                      "UPLOAD RC DETAILS",
                      style: MFonts.fontAH1,
                    ),
                    SizedBox(height: MSizes.spaceBtwSections),
                    Text(
                      "Submit RC Details",
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
                height: MHelperFunctions.screenHeight() * 0.35,
                child: Stack(
                  children: [
                    // Image background
                    //Image from camera
                    Image.network(
                      'https://via.placeholder.com/400x300',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Cutout Rectangle
                    CustomPaint(
                      painter: RectanglePainter(),
                      child: const Center(
                        
                      ),
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
                    SizedBox(height: MSizes.spaceBtwSections),
                    SizedBox(height: MSizes.spaceBtwSections),
                    SizedBox(height: MSizes.spaceBtwSections),
                    SizedBox(height: MSizes.spaceBtwSections),
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

    // Draw inner rectangle as a hole
    const double aadharCardRatio = 1.587; // Ratio of a credit card
    final double holeWidth = size.width * 0.88; // Adjust as needed
    final double holeHeight =
        holeWidth / aadharCardRatio; // Calculate height based on ratio

    final holeSize = Size(holeWidth, holeHeight);
    final holeRect = Rect.fromCenter(
      center: size.center(Offset.zero),
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
