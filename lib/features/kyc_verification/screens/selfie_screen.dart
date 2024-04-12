import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/kyc_verification/screens/upload_choice.dart';
import 'package:motodealz/splash_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class UserVerificationSelfieScreen extends StatefulWidget {
  const UserVerificationSelfieScreen({super.key});

  @override
  State<UserVerificationSelfieScreen> createState() =>
      _UserVerificationSelfieScreenState();
}

class _UserVerificationSelfieScreenState
    extends State<UserVerificationSelfieScreen> {
  late Future<void> _initFuture;
  late CameraController _controller;
  final userRepository = Get.put(UserRepository());
  bool isUploading = false;
  final user = FirebaseAuth.instance.currentUser;
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
      // Find the front-facing camera
      final CameraDescription frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );
      _controller = CameraController(
        frontCamera,
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
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: MSizes.defaultSpace,
                    right: MSizes.defaultSpace,
                    top: MSizes.nm,
                    bottom: MSizes.defaultSpace,
                  ),
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
                        MImages.progressBar2,
                        colorFilter: MSvgStyle.svgStyle3(darkMode),
                      ),
                      const SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                      const Text(
                        "Take a Selfie",
                        style: MFonts.fontBH1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                SizedBox(
                  width: MHelperFunctions.screenWidth(),
                  height: MHelperFunctions.screenHeight() * 0.50,
                  child: Stack(
                    children: [
                      //Image from camera
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
                      LargeButtonNS(
                        onPressed: _controller.value.isInitialized == true
                            ? _uploadImageAndNavigate
                            : null,
                        child: const Text("Take a picture"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (isUploading) // Show the progress indicator if uploading
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIndicator(),
                      SizedBox(
                        height: MSizes.md,
                      ),
                      Text(
                        'Uploading...',
                        style: MFonts.fontCH4,
                      )
                    ],
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }

  Future<void> _uploadImageAndNavigate() async {
    try {
      image = await _controller.takePicture();
    } catch (e) {
      // Handle error
      // print(e);
    }
    if (image != null) {
      try {
        setState(() {
          isUploading = true; // Set isUploading to true before uploading
        });
        // Convert XFile to File
        File imageFile = File(image!.path);
        // Upload image to Firebase Storage
        final firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('Kycselfies/${path.basename(image!.path)}');
        await ref.putFile(imageFile); // Pass the File object

        // Update the user's KYC selfie path in Firestore
        await UserRepository().updateUserKYCSelfie(
            user!.uid, 'Kycselfies/${path.basename(image!.path)}');
        // Navigate to the next screen
        MHelperFunctions.navigateToScreen(
            // ignore: use_build_context_synchronously
            context,
            const UserVerificationUploadChoiceScreen());
        setState(() {
          isUploading = false;
        });
      } catch (e) {
        setState(() {
          isUploading = false;
        });
      }
    }
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
