import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
import 'package:motodealz/features/shop/model/vehicle_model.dart';
import 'package:motodealz/features/shop/screens/vehicle_image_veiw_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/common/widgets/image_carousel.dart';

class VehicleVeiwScreen extends StatefulWidget {
  const VehicleVeiwScreen({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  VehicleVeiwScreenState createState() => VehicleVeiwScreenState();
}

class VehicleVeiwScreenState extends State<VehicleVeiwScreen> {
  bool _hasNavigatedToImageViewScreen = false;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                _navigateToImageViewScreen(context);
              },
              child: MImageCarousel1(images: widget.vehicle.images),
            ),
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
                    Text(
                      MFormatter.formatCurrency(widget.vehicle.price),
                      style: MFonts.fontCH1,
                    ),
                    const SmallButton(child: Text("Chat"))
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
}
