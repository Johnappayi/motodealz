import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class VehicleDetailsEditUI extends StatefulWidget {
  final String vehicleId;
  const VehicleDetailsEditUI({
    super.key,
    required this.vehicleId,
  });

  @override
  VehicleDetailsEditUIState createState() => VehicleDetailsEditUIState();
}

class VehicleDetailsEditUIState extends State<VehicleDetailsEditUI> {
  late Vehicle vehicle;
  late TextEditingController _adTitleController;
  late TextEditingController _adDescriptionController;
  final _vehicleController = Get.put(VehicleController());

  @override
  void initState() {
    super.initState();
    _adTitleController = TextEditingController(); // Initialize directly
    _adDescriptionController = TextEditingController();
    _initializeVehicle();
  }

  Future<void> _initializeVehicle() async {
    try {
      vehicle = await _vehicleController.fetchVehicleDetails(widget.vehicleId);
      setState(() {
        _adTitleController = TextEditingController(text: vehicle.title);
        _adDescriptionController =
            TextEditingController(text: vehicle.description);
      });
    } catch (e) {
      // Handle error if vehicle is not found or fetching fails
    }
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
        case 'Ad Title':
          vehicle.title = value;
          break;
        case 'Ad Description':
          vehicle.description = value;
          break;
      }
    });
  }
  void _saveChanges() {
    // Save the updated vehicle data using the controller
    _vehicleController.updateVehicleDetails(vehicle);
    // Pop the screen to go back
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildEditForm(),
    );
  }

  Widget _buildEditForm() {
    return SingleChildScrollView(
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
          _buildEditableFieldLarge('Ad Description', _adDescriptionController),
          const SizedBox(height: MSizes.spaceBtwInputFields),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallSecButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              SmallButton(
                onPressed:_saveChanges,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
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
          height: MSizes.inputFieldHeight,
          child: TextField(
            controller: controller,
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
