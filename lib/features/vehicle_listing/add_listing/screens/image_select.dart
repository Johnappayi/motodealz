import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/final_screen.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/selected_image_gallery.dart';

class VehicleImageSelectScreen extends StatefulWidget {
  const VehicleImageSelectScreen({super.key});

  @override
  VehicleImageSelectScreenState createState() =>
      VehicleImageSelectScreenState();
}

class VehicleImageSelectScreenState extends State<VehicleImageSelectScreen> {
  final _imagePicker = ImagePicker(); // Create ImagePicker instance
  final _maxImageCount = 10; // Maximum number of images allowed

  List<File> selectedImages = [];

  Future<void> _pickMultipleImages() async {
    // Pick multiple images directly without requesting permissions
    final pickedImages = await _imagePicker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      final selectedFiles =
          pickedImages.map((image) => File(image.path)).toList();

      // Check if adding new images exceeds maximum
      if (selectedImages.length + selectedFiles.length > _maxImageCount) {
        Get.snackbar(
          "Image Limit Reached",
          "You can only select up to $_maxImageCount images.",
          snackPosition: SnackPosition.BOTTOM,
        );
        // Filter out images that would exceed the limit
        final allowedImages =
            selectedFiles.sublist(0, _maxImageCount - selectedImages.length);
        setState(() {
          selectedImages.addAll(allowedImages);
        });
        return;
      }

      setState(() {
        selectedImages.addAll(selectedFiles);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MSizes.defaultSpace, vertical: MSizes.nm),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonContainer(
                      onPressed: () {
                        Get.offAll(const NavigationMenu());
                      },
                      child: MImages.closeIcon,
                    ),
                  ],
                ),
                const Text(
                  "VEHICLE IMAGE",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(height: MSizes.defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upload photos",
                      style: MFonts.fontCH4,
                    ),
                    const SizedBox(height: MSizes.sm),
                    SelectFile(
                      onPressed: _pickMultipleImages,
                    ),
                  ],
                ),
                if (selectedImages.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: MSizes.spaceBtwSections),
                      const Text(
                        "Selected photos",
                        style: MFonts.fontCH4,
                      ),
                      const SizedBox(height: MSizes.sm),
                      SelectedImageGallery(
                        images:
                            selectedImages.map((file) => file.path).toList(),
                        onImageRemoved: _removeImage,
                      ),
                    ],
                  ),
                const SizedBox(height: MSizes.spaceBtwSections),
                LargeButtonNS(
                  onPressed: selectedImages.isNotEmpty
                      ? () => MHelperFunctions.navigateToScreen(
                            context,
                            const VehicleVerificationLastScreen(),
                          )
                      : null,
                  child: const Text("Upload"), // Disable button if no images are uploaded
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
