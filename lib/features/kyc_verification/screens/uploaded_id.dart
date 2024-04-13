// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/kyc_verification/screens/final_screen.dart';
import 'package:motodealz/features/kyc_verification/screens/upload_choice.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationUploadedIDScreen extends StatefulWidget {
  const UserVerificationUploadedIDScreen(
      {super.key, required this.imageFrontPath, required this.imageBackPath});
  final String imageFrontPath;
  final String imageBackPath;

  @override
  State<UserVerificationUploadedIDScreen> createState() =>
      _UserVerificationUploadedIDScreenState();
}

class _UserVerificationUploadedIDScreenState
    extends State<UserVerificationUploadedIDScreen> {
  final userRepository = Get.put(UserRepository());
  final user = FirebaseAuth.instance.currentUser;
  bool isUploading = false;

  Future<void> uploadImageToStorage(
      String imagePath1, String imagePath2) async {
    setState(() {
      isUploading = true; // Set isUploading to true before uploading
    });
    try {
      // Generate a unique file name for the image
      String fileName1 =
          '${DateTime.now().millisecondsSinceEpoch}_${imagePath1.split('/').last}';
      String fileName2 =
          '${DateTime.now().millisecondsSinceEpoch}_${imagePath2.split('/').last}';
      // Reference to the Firebase Storage bucket
      Reference reference1 =
          FirebaseStorage.instance.ref().child('Kycimages/$fileName1');
      Reference reference2 =
          FirebaseStorage.instance.ref().child('Kycimages/$fileName2');

      // Upload the image to Firebase Storage
      await reference1.putFile(File(imagePath1));
      await reference2.putFile(File(imagePath2));
      List<String> paths = ['Kycimages/$fileName1', 'Kycimages/$fileName2'];
      await userRepository.updateUserKYCDoc(user!.uid, paths);
      setState(() {
        isUploading = false;
      });
    } catch (error) {
      // print('Error uploading image: $error');
      // Handle error
      setState(() {
        isUploading = false; // Ensure isUploading is set to false on error too
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        _handleBackButton(context);
        // Prevent default back button behavior
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: MSizes.defaultSpace,
                  right: MSizes.defaultSpace,
                  top: MSizes.nm,
                  bottom: MSizes.defaultSpace),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ButtonContainer(
                          onPressed: () {
                            Get.offAll(() =>
                                const UserVerificationUploadChoiceScreen());
                          },
                          child: MImages.backIcon)
                    ],
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
                  // const Text(
                  //   "Uploaded ID Card",
                  //   style: MFonts.fontBH1,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Front side",
                        style: MFonts.fontCH4,
                      ),
                      const SizedBox(
                        height: MSizes.nm,
                      ),
                      SizedBox(
                        width: MHelperFunctions.screenWidth(),
                        height: MHelperFunctions.screenWidth() / 2.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(widget.imageFrontPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                      const Text(
                        "Back side",
                        style: MFonts.fontCH4,
                      ),
                      const SizedBox(
                        height: MSizes.nm,
                      ),
                      SizedBox(
                        width: MHelperFunctions.screenWidth(),
                        height: MHelperFunctions.screenWidth() / 2.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(widget.imageBackPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MSizes.sm,
                      ),
                      Text(
                        "Please ensure that the provided images are clear and visible",
                        style:
                            MFonts.fontCB2.copyWith(color: MColors.lightGrey),
                      ),
                      const SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                      LargeButtonNS(
                          child: const Text("Verify"),
                          onPressed: () async {
                            await uploadImageToStorage(
                                widget.imageFrontPath, widget.imageBackPath);
                            MHelperFunctions.navigateToScreen(
                                // ignore: use_build_context_synchronously
                                context,
                                const UserVerificationLastScreen());
                          }),
                    ],
                  )
                ],
              ),
            )),
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
      ),
    );
  }

  void _handleBackButton(BuildContext context) {
    // Handle custom back navigation
    Get.offAll(() => const UserVerificationUploadChoiceScreen());
  }
}
