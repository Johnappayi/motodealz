import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/uploaded_rc.dart';
import 'package:motodealz/splash_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:permission_handler/permission_handler.dart';

class VehicleVerificationIdCaptureScreen extends StatefulWidget {
  const VehicleVerificationIdCaptureScreen({Key? key}) : super(key: key);

  @override
  State<VehicleVerificationIdCaptureScreen> createState() =>
      _VehicleVerificationIdCaptureScreenState();
}

class _VehicleVerificationIdCaptureScreenState
    extends State<VehicleVerificationIdCaptureScreen> {
  late Future<void> _initFuture;
  late CameraController _controller;
  XFile? image; // Initialize image to null

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

  Widget _buildScreen() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.defaultSpace,
                  vertical: MSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonContainer(
                          onPressed: () {
                            Get.offAll(() => const NavigationMenu());
                          },
                          child: MImages.closeIcon,
                        )
                      ],
                    ),
                    const Text(
                      "UPLOAD RC DETAILS",
                      style: MFonts.fontAH1,
                    ),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const Text(
                      "Submit RC Details",
                      style: MFonts.fontBH1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
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
                        : const Center(child: CircularProgressIndicator()),
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
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    const SizedBox(height: MSizes.defaultSpace),
                    LargeButtonNS(
                      onPressed: _controller.value.isInitialized == true
                          ? () async {
                              try {
                                image = await _controller.takePicture();
                                if (mounted) {
                                  MHelperFunctions.navigateToScreen(
                                      context,
                                      UploadedRCScreen(
                                        imagePath: image!.path,
                                      ));
                                }
                              } catch (e) {
                                // print(e);
                              }
                            }
                          : null,
                      child: const Text("Take a picture"),
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
