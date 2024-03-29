// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/features/vehicle_listing/controller/ad_controller.dart';
import 'package:motodealz/features/vehicle_listing/model/ad_model.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class VehicleDetailsEditUI extends StatefulWidget {
  final String vehicleId;
  // final Vehicle vehicle;

  const VehicleDetailsEditUI({
    Key? key,
    // required this.vehicle,
    required this.vehicleId,
  }) : super(key: key);

  @override
  VehicleDetailsEditUIState createState() => VehicleDetailsEditUIState();
}

class VehicleDetailsEditUIState extends State<VehicleDetailsEditUI> {
  late Vehicle vehicle;
  late AdListed adDetails;
  late TextEditingController _adTitleController;
  late TextEditingController _adDescriptionController;

  @override
  void initState() {
    super.initState();
    vehicle = VehicleController().getVehicleById(widget.vehicleId);
    adDetails = AdController().getAdDetailsByVehicleId(widget.vehicleId);

    _adTitleController = TextEditingController(text: adDetails.title);
    _adDescriptionController =
        TextEditingController(text: adDetails.description);
  }

  @override
  void dispose() {
    _adTitleController.dispose();
    _adDescriptionController.dispose();
    super.dispose();
  }

  void _onFieldChanged(String field, String value) {
    // Update the corresponding vehicle detail based on the field name
    setState(() {
      switch (field) {
        case 'Brand':
          adDetails.title = value;
          break;
        case 'Model':
          adDetails.description = value;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: MSizes.appBarHeight,
            ),
            const Text(
              "Edit Ad Details",
              style: MFonts.fontAH1,
            ),
            const SizedBox(height: MSizes.spaceBtwSections),
            _buildEditableField('Ad Title', _adTitleController),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            _buildEditableFieldLarge(
                'Ad Description', _adDescriptionController),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallSecButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                SmallButton(
                  onPressed: () {
                    // Submit the form and update the vehicle details
                    // For now, we'll just print the updated details
                    // print('Updated Ad Details:');
                    // print('Ad Title: ${adDetails.title}');
                    // print('Ad Description: ${adDetails.description}');
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: MSizes.sm),
        SizedBox(
          height:
              MSizes.inputFieldHeight, // Set a fixed height for the TextField
          child: TextField(
            controller: controller,// Allow unlimited lines
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => _onFieldChanged(label, value),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableFieldLarge(
      String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: MSizes.sm),
        SizedBox(
          height: MSizes.inputFieldHeight2,
          child: TextField(
            controller: controller,
            maxLines: null, // Allow unlimited lines
            onChanged: (value) => _onFieldChanged(label, value),
          ),
        ),
      ],
    );
  }
}
