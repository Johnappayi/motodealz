import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/features/kyc_verification/screens/uploaded_id.dart';
import 'package:motodealz/splash_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:permission_handler/permission_handler.dart';

class UserVerificationIdCaptureScreen extends StatefulWidget {
  const UserVerificationIdCaptureScreen({super.key});

  @override
  UserVerificationIdCaptureScreenState createState() =>
      UserVerificationIdCaptureScreenState();
}

class UserVerificationIdCaptureScreenState
    extends State<UserVerificationIdCaptureScreen> {
  int _currentStep = 1; // 1 for front side, 2 for back side
  late Future<void> _initFuture;
  late CameraController _controller;
  XFile? imageFront;
  XFile? imageBack;

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeEverything();
  }

  Future<void> _initializeEverything() async {
    await _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      // Handle denied permission or show a message to the user
      //print('Camera permission denied');
      return;
    }

    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.veryHigh,
      );
      await _controller.initialize(); // Wait for controller initialization
      if (mounted) {
        setState(() {}); // Trigger a rebuild after camera initialization
      }
    } catch (e) {
      //print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SplashScreen2(),
          );
        } else {
          return _buildScreen();
        }
      },
    );
  }

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
  }

  Widget _buildScreen() {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
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
                    SvgPicture.asset(
                      MImages.progressBar3,
                      colorFilter: MSvgStyle.svgStyle3(darkMode),
                    ),
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
                    // Camera preview clipped to the desired portion
                    _controller.value.isInitialized == true
                        ? ClipRect(
                            child: Align(
                              alignment: Alignment.center,
                              child: OverflowBox(
                                maxWidth: double.infinity,
                                maxHeight: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MHelperFunctions.screenWidth(),
                                    child: CameraPreview(_controller),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const CustomIndicator(),
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
                      onPressed: () async {
                        // Add logic to capture photo
                        if (_currentStep == 1) {
                          // Capture front side photo
                          if (_controller.value.isInitialized) {
                            try {
                              imageFront = await _controller.takePicture();
                            } catch (e) {
                              // Handle error
                              // print(e);
                            }
                          }
                          // Proceed to next step
                          _nextStep();
                        } else {
                          // Capture back side photo
                          if (_controller.value.isInitialized) {
                            try {
                              imageBack = await _controller.takePicture();
                              if (mounted) {
                                // Navigate to next page or perform desired action
                                MHelperFunctions.navigateToScreen(
                                  context,
                                  UserVerificationUploadedIDScreen(
                                    imageFrontPath: imageFront!.path,
                                    imageBackPath: imageBack!.path,
                                  ),
                                );
                              }
                            } catch (e) {
                              // Handle error
                              // print(e);
                            }
                          }
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
