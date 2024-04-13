import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/car_info.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UploadedRCScreen extends StatelessWidget {
  const UploadedRCScreen({super.key, required this.imagePath});
  final String imagePath;


  Future<void> uploadImageToStorage(String imagePath) async {
    try {
      // Generate a unique file name for the image
      String fileName = '${DateTime.now().millisecondsSinceEpoch}_${imagePath.split('/').last}';
      // Reference to the Firebase Storage bucket
      Reference reference = FirebaseStorage.instance.ref().child('Rcimages/$fileName');
      // Upload the image to Firebase Storage
      await reference.putFile(File(imagePath));
    } catch (error) {
      // print('Error uploading image: $error');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MSizes.defaultSpace,
              vertical: MSizes.defaultSpace,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [MBackButton()],
                ),
                const Text(
                  "UPLOADED RC",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const Text(
                  "Review the uploaded RC",
                  style: MFonts.fontBH1,
                ),
                const SizedBox(height: MSizes.defaultSpace),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.defaultSpace),
                SizedBox(
                  width: MHelperFunctions.screenWidth(),
                  height: MHelperFunctions.screenWidth()/1.587,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: MSizes.sm),
                Text(
                  "Please ensure that the provided images are clear and visible",
                  style: MFonts.fontCB2.copyWith(color: MColors.lightGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MSizes.defaultSpace),
                const SizedBox(height: MSizes.spaceBtwSections),
                LargeButtonNS(
                  child: const Text("Continue"),
                  onPressed: () async {
                    await uploadImageToStorage(imagePath);
                    MHelperFunctions.navigateToScreen(
                      // ignore: use_build_context_synchronously
                      context,
                      VehicleListingInfoScreen(rcImagePath: imagePath,),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
