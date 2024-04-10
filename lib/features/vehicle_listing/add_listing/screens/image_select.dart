import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/common/widgets/selected_image_gallery.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'final_screen.dart';

class VehicleImageSelectScreen extends StatefulWidget {
  const VehicleImageSelectScreen(
      {super.key, required this.vehicle, required this.rcImagePath});
  final Vehicle vehicle;
  final String rcImagePath;
  @override
  VehicleImageSelectScreenState createState() =>
      VehicleImageSelectScreenState();
}

class VehicleImageSelectScreenState extends State<VehicleImageSelectScreen> {
  final userRepository = Get.put(UserRepository());
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
      Map<String, List<String>> uploadedImagePaths =
          await uploadImagesToStorage(selectedImages, widget.rcImagePath);

      if (_isMounted) {
        // Update Ad object with uploaded image paths
        setState(() {
          widget.vehicle.images.addAll(uploadedImagePaths['vehicleImages']!);
          // widget.vehicle.rcImage = uploadedImagePaths['rcImage']!.first; // Assuming RC image is single
        });

        /// Upload vehicle details to Firestore
        String vehicleId = await VehicleController.instance
            .uploadVehicleToFirestore(widget.vehicle);
        // Update the user's vehicles list in Firestore with the new vehicle ID
        await userRepository.updateUserVehiclesList(
            widget.vehicle.ownerId, vehicleId);
        setState(() {
          isUploading = false;
        });
        // Navigate to next screen
        MHelperFunctions.navigateToScreen(
          // ignore: use_build_context_synchronously
          context,
          const VehicleVerificationLastScreen(),
        );
      }
    }
  }

  Future<Map<String, List<String>>> uploadImagesToStorage(
      List<File> vehicleImages, String rcImagePath) async {
    Map<String, List<String>> uploadedImagePaths = {
      'vehicleImages': [],
      'rcImage': [],
    };
    try {
      // Upload vehicle images
      for (File image in vehicleImages) {
        String fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';
        Reference reference =
            FirebaseStorage.instance.ref().child('Vehicleimages/$fileName');
        await reference.putFile(image);
        String pathName = 'Vehicleimages/$fileName';
        uploadedImagePaths['vehicleImages']!.add(pathName);
      }
      // Upload RC image
      String rcFileName =
          '${DateTime.now().millisecondsSinceEpoch}_${rcImagePath.split('/').last}';
      Reference rcReference =
          FirebaseStorage.instance.ref().child('Rcimages/$rcFileName');
      await rcReference.putFile(File(rcImagePath));
      String rcPathName = 'Rcimages/$rcFileName';
      uploadedImagePaths['rcImage']!.add(rcPathName);
    } catch (error) {
      // Handle error
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
        child: Stack(
          children: [
            SingleChildScrollView(
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
                            images: selectedImages
                                .map((file) => file.path)
                                .toList(),
                            onImageRemoved: _removeImage,
                          ),
                        ],
                      ),
                    const SizedBox(height: MSizes.spaceBtwSections),
                    LargeButtonNS(
                      onPressed: selectedImages.isNotEmpty && !isUploading
                          ? _uploadImages
                          : null,
                      child: isUploading
                          ? const Text("Uploading")
                          : const Text("Upload"),
                    ),
                  ],
                ),
              ),
            ),
            if (isUploading) // Show the progress indicator if uploading
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Column(
                      children: [
                        CustomIndicator(),
                        SizedBox(height: MSizes.md,),
                        Text('Uploading...',style: MFonts.fontCH4,)
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
