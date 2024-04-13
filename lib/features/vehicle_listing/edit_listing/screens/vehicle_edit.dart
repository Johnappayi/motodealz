// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/image_carousel.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/shop/screens/vehicle_image_veiw_page.dart';
import 'package:motodealz/features/vehicle_listing/edit_listing/screens/vehicle_details_edit_ui.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';
import 'package:motodealz/utils/popups/loader.dart';

class VehicleEditScreen extends StatefulWidget {
  const VehicleEditScreen({super.key, required this.vehicle});
  final Vehicle vehicle;

  @override
  State<VehicleEditScreen> createState() => _VehicleEditScreenState();
}

class _VehicleEditScreenState extends State<VehicleEditScreen> {
  final _vehicleController = Get.put(VehicleController());
  final _userController = Get.put(UserRepository());
  bool _hasNavigatedToImageViewScreen = false;
  final List<String> _imageUrls = [];
  Future<List<String>> _fetchImages() async {
    for (String imageUrl in widget.vehicle.images) {
      String httpsUrl = await MHttpHelper.convertGCSUrlToHttps(imageUrl);
      _imageUrls.add(httpsUrl);
    }
    return _imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => _navigateToImageViewScreen(context),
              child: FutureBuilder<List<String>>(
                future: _fetchImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while fetching images
                    return Image.asset(
                      darkMode ? MImages.sampleCarDarkMode : MImages.sampleCar,
                      height: MHelperFunctions.screenHeight() * 0.45,
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    // Show an error message if fetching images fails
                    return const Center(child: Text('Error fetching images'));
                  } else {
                    // Build MImageCarousel1 with fetched images
                    return MImageCarousel1(images: snapshot.data!);
                  }
                },
              ),
            ),
            //Later change this to carousel
            MyDraggableSheet(
              child: Column(
                children: [
                  VehicleDetailsUI(vehicle: widget.vehicle),
                  const SizedBox(
                    height: 90,
                  ) //Dont remove this
                ],
              ),
              onCollapse: () {
                _navigateToImageViewScreen(context);
              },
            ),
            const Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(MSizes.lg),
                child: MBackButton(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MHelperFunctions.screenWidth(),
                padding: const EdgeInsets.all(MSizes.lg),
                decoration: BoxDecoration(
                    color: darkMode ? MColors.black : MColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallSecButton(
                        onPressed: _deleteVehicle, child: const Text("Delete")),
                    SmallButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VehicleDetailsEditUI(
                              vehicleId: widget.vehicle.id ?? '',
                            ),
                          ),
                        );
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToImageViewScreen(BuildContext context) {
    if (!_hasNavigatedToImageViewScreen && _imageUrls.isNotEmpty) {
      _hasNavigatedToImageViewScreen = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VehicleImageViewScreen(vehicleImages: _imageUrls),
        ),
      ).then((_) {
        // Reset the flag when the navigation is completed
        _hasNavigatedToImageViewScreen = false;
      });
    }
  }

  void _deleteVehicle() async {
    final vehicle = widget.vehicle; // Access the vehicle from widget
    final darkmode = MHelperFunctions.isDarkMode(context);
    // Confirmation dialog
    final shouldDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Vehicle'),
        content: Text('Are you sure you want to delete "${vehicle.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel',
                style: TextStyle(
                    color: darkmode ? MColors.textWhite : MColors.black)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete',
                style:
                    TextStyle(color: darkmode ? MColors.black : MColors.white)),
          ),
        ],
      ),
    );

    if (shouldDelete != null && shouldDelete) {
      try {
        // Call the deleteVehicle method from VehicleController (assuming it deletes from Firestore)
        await _vehicleController.deleteVehicle(vehicle);

        // Remove the vehicle ID from the user's document
        await _userController.removeVehicleFromUser(vehicle.id!);

        // Use a separate variable to store context
        final currentContext = context;

        // Close the edit screen after successful deletion (outside async)
        Navigator.pop(currentContext);

        // Show success message (optional)
        if (currentContext.mounted) {
          // Check if widget is still mounted
          MLoaders.successSnackBar(
              title: 'Deleted!',
              message: 'You Ad has been successfully deleted.');
        }
      } catch (e) {
        // Handle errors (e.g., network issues, permission errors)
        MLoaders.errorSnackBar(
            title: 'Deletion Failed', message: 'Error deleting vehicle: $e');
      }
    }
  }
}
