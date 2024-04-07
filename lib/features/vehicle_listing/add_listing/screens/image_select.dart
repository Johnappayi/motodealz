import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/common/widgets/selected_image_gallery.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/model/ad_model.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'final_screen.dart';

class VehicleImageSelectScreen extends StatefulWidget {
  const VehicleImageSelectScreen({super.key, required this.ad});
  final Ad ad;

  @override
  VehicleImageSelectScreenState createState() =>
      VehicleImageSelectScreenState();
}

class VehicleImageSelectScreenState extends State<VehicleImageSelectScreen> {
  final _imagePicker = ImagePicker();
  final _maxImageCount = 10;

  List<File> selectedImages = [];
  bool isUploading = false;
  bool _isMounted = true;

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> _pickMultipleImages() async {
    final pickedImages = await _imagePicker.pickMultiImage();
    if (_isMounted && pickedImages.isNotEmpty) {
      final selectedFiles =
          pickedImages.map((image) => File(image.path)).toList();

      // Check if adding new images exceeds maximum
      if (selectedImages.length + selectedFiles.length > _maxImageCount) {
        Get.snackbar(
          "Image Limit Reached",
          "You can only select up to $_maxImageCount images.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      if (_isMounted) {
        setState(() {
          selectedImages.addAll(selectedFiles);
        });
      }
    }
  }

  Future<void> _uploadImages() async {
    if (_isMounted) {
      setState(() {
        isUploading = true;
      });

      // Upload images to cloud storage and get their paths
      List<String> uploadedImagePaths =
          await uploadImagesToStorage(selectedImages);

      if (_isMounted) {
        // Update Ad object with uploaded image paths
        setState(() {
          widget.ad.images.addAll(uploadedImagePaths);
          isUploading = false;
        });

        // Add the Ad to the vehicles collection using VehicleController
        VehicleController.instance.uploadAdToFirestore(widget.ad);

        // Navigate to next screen
        MHelperFunctions.navigateToScreen(
          // ignore: use_build_context_synchronously
          context,
          const VehicleVerificationLastScreen(),
        );
      }
    }
  }

  Future<List<String>> uploadImagesToStorage(List<File> images) async {
    List<String> uploadedImagePaths = [];
    try {
      for (File image in images) {
        // Generate a unique file name for each image
        String fileName = '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';
        // Reference to the Firebase Storage bucket
        Reference reference =
            FirebaseStorage.instance.ref().child('Vehicleimages/$fileName');
        // Upload the image to Firebase Storage
        await reference.putFile(image);
        // Get the file name (without 'gs://' prefix)
        String pathName = reference.name;
        // Add the file name to the list of uploaded image paths
        uploadedImagePaths.add(pathName);
      }
    } catch (error) {
      // print('Error uploading images: $error');
    }
    return uploadedImagePaths;
  }

  void _removeImage(int index) {
    if (_isMounted) {
      setState(() {
        selectedImages.removeAt(index);
      });
    }
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
                  onPressed: isUploading ? null : _uploadImages,
                  child: isUploading
                      ? const Row(children: [
                          CircularProgressIndicator(),
                          Text("Uploading"),
                        ])
                      : const Text("Upload"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
