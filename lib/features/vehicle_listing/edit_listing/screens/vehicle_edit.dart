import 'package:flutter/material.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/image_carousel.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
import 'package:motodealz/features/shop/screens/vehicle_image_veiw_page.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/controller/ad_controller.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/model/ad_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

import 'vehicle_details_edit_ui.dart';

class VehicleEditScreen extends StatefulWidget {
  const VehicleEditScreen({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;
  

  @override
  State<VehicleEditScreen> createState() => _VehicleEditScreenState();
}

class _VehicleEditScreenState extends State<VehicleEditScreen> {
  bool _hasNavigatedToImageViewScreen = false;
  

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    AdListed adListed = AdController().getAdDetailsByVehicleId(widget.vehicle.id);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                _navigateToImageViewScreen(context);
              },
              child: MImageCarousel1(images: widget.vehicle.images),
            ), //Later change this to carousel
            MyDraggableSheet(
              child: Column(
                children: [
                  VehicleDetailsUI(
                    vehicle: widget.vehicle, adListed: adListed,
                  ),
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
                              vehicleId: widget.vehicle.id,
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
    if (!_hasNavigatedToImageViewScreen) {
      _hasNavigatedToImageViewScreen = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VehicleImageViewScreen(vehicle: widget.vehicle),
        ),
      ).then((_) {
        // Reset the flag when the navigation is completed
        _hasNavigatedToImageViewScreen = false;
      });
    }
  }

  void _deleteVehicle() {
    // Delete vehicle logic here
    // For example:
    // VehicleController().deleteVehicle(widget.vehicle);
    // After deleting, you might want to navigate back or do any other action
  }
}
