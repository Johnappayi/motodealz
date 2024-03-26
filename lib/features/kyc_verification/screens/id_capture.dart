import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/kyc_verification/screens/uploaded_id.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationIdCaptureScreen extends StatefulWidget {
  const UserVerificationIdCaptureScreen({Key? key}) : super(key: key);

  @override
  UserVerificationIdCaptureScreenState createState() =>
      UserVerificationIdCaptureScreenState();
}

class UserVerificationIdCaptureScreenState
    extends State<UserVerificationIdCaptureScreen> {
  int _currentStep = 1; // 1 for front side, 2 for back side

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: MSizes.defaultSpace,
                    right: MSizes.defaultSpace,
                    top: MSizes.nm,
                    bottom: MSizes.defaultSpace),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [MBackButton()],
                    ),
                    const Text(
                      "KYC VERIFICATION",
                      style: MFonts.fontAH1,
                    ),
                    const SizedBox(
                      height: MSizes.spaceBtwSections,
                    ),
                    SvgPicture.asset(MImages.progressBar3),
                    const SizedBox(
                      height: MSizes.defaultSpace,
                    ),
                    const Text(
                      "Submit ID Card",
                      style: MFonts.fontBH1,
                    ),
                  ],
                ),
              ),
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
                      child: const Center(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.nm),
               Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.defaultSpace,
                  vertical: MSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    Text(
                      _currentStep == 1
                          ? "Take a photo of the FRONT side"
                          : "Take a photo of the BACK side",
                      style: MFonts.fontCB1,
                    ),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    LargeButtonNS(
                      child: const Text("Take a picture"),
                      onPressed: () {
                        // Add logic to capture photo
                        if (_currentStep == 1) {
                          // Capture front side photo
                          // Proceed to next step
                          _nextStep();
                        } else {
                          // Capture back side photo
                          // Navigate to next page or perform desired action
                          MHelperFunctions.navigateToScreen(context, const UserVerificationUploadedIDScreen());
                        }
                      },
                    ),
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
