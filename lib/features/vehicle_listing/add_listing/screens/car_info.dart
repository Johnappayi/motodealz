import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/image_select.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleListingInfoScreen extends StatefulWidget {
  final Vehicle? vehicle; // Pass the vehicle object to the screen
   final String rcImagePath;
  const VehicleListingInfoScreen({super.key, this.vehicle, required this.rcImagePath});

  @override
  VehicleListingInfoScreenState createState() =>
      VehicleListingInfoScreenState();
}

class VehicleListingInfoScreenState extends State<VehicleListingInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  // Define controllers for each input field
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _kmDrivenController = TextEditingController();
  final TextEditingController _ownersController = TextEditingController();
  final TextEditingController _transmissionController = TextEditingController();
  final TextEditingController _fuelTypeController = TextEditingController();
  final TextEditingController _adTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _registrationNoController =
      TextEditingController();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Populate input fields if vehicle data is available
    if (widget.vehicle != null) {
      _populateFields();
    }
  }

  void _populateFields() {
    _brandController.text = widget.vehicle!.brand;
    _modelController.text = widget.vehicle!.model;
    _yearController.text = widget.vehicle!.year.toString();
    _kmDrivenController.text = widget.vehicle!.mileage.toString();
    _ownersController.text = widget.vehicle!.ownershipCount.toString();
    _adTitleController.text = widget.vehicle!.title;
    _descriptionController.text = widget.vehicle!.description;
    _registrationNoController.text = widget.vehicle!.rcNumber;
    _vinController.text = widget.vehicle!.vinNumber;
    _priceController.text = widget.vehicle!.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace,
            ),
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
                    )
                  ],
                ),
                const Text(
                  "SELL YOUR CAR",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(
                  height: MSizes.spaceBtwSections,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField(
                        label: "Brand",
                        hintText: "Enter brand name",
                        controller: _brandController,
                      ),
                      InputField(
                        label: "Model",
                        hintText: "Enter the model",
                        controller: _modelController,
                      ),
                      InputFieldWithDropdown(
                        hintText: "Select transmission type",
                        label: "Transmission",
                        dropdownValue: _transmissionController.text.isNotEmpty
                            ? _transmissionController.text
                            : null,
                        dropdownItems: const [
                          DropdownMenuItem<String>(
                            value: 'Manual',
                            child: Text('Manual'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Automatic',
                            child: Text('Automatic'),
                          ),
                        ],
                        dropdownOnChanged: (newValue) {
                          setState(() {
                            _transmissionController.text = newValue!;
                          });
                        },
                      ),
                      InputFieldWithDropdown(
                        hintText: "Select fuel type",
                        label: "Fuel Type",
                        dropdownValue: _fuelTypeController.text.isNotEmpty
                            ? _fuelTypeController.text
                            : null,
                        dropdownItems: const [
                          DropdownMenuItem<String>(
                            value: 'Petrol',
                            child: Text('Petrol'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Diesel',
                            child: Text('Diesel'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Electric',
                            child: Text('Electric'),
                          ),
                        ],
                        dropdownOnChanged: (newValue) {
                          setState(() {
                            _fuelTypeController.text = newValue!;
                          });
                        },
                      ),
                      InputField(
                        label: "Year",
                        hintText: "Enter the make year",
                        controller: _yearController,
                      ),
                      InputField(
                        label: "KM driven",
                        hintText: "Enter total KMs driven",
                        controller: _kmDrivenController,
                      ),
                      InputField(
                        label: "No. of Owners",
                        hintText: "Enter no. of owners",
                        controller: _ownersController,
                      ),
                      InputFieldWithDropdown(
                        hintText: "Select vehicle category",
                        label: "Category",
                        dropdownValue: _categoryController.text.isNotEmpty
                            ? _categoryController.text
                            : null,
                        dropdownItems: [
                          "Coupe",
                          "Hatchback",
                          "MUV",
                          "Pickup",
                          "Sedan",
                          "SUV"
                        ].map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        dropdownOnChanged: (value) {
                          setState(() {
                            _categoryController.text = value!;
                          });
                        },
                      ),
                      InputField(
                        label: "Ad title",
                        hintText: "Enter an ad title",
                        controller: _adTitleController,
                      ),
                      InputField(
                        label: "Description",
                        hintText: "Describe the details of your vehicle",
                        controller: _descriptionController,
                      ),
                      InputField(
                        label: "Registeration no.",
                        hintText: "Enter the licence plate number ",
                        controller: _registrationNoController,
                      ),
                      InputField(
                        label: "VIN Number",
                        hintText: "Enter the vehicle identification number",
                        controller: _vinController,
                      ),
                      InputField(
                        label: "Price",
                        hintText: "Enter the price of the vehicle",
                        controller: _priceController,
                      ),
                      const SizedBox(
                        height: MSizes.spaceBtwSections,
                      ),
                      LargeButtonNS(
                        child: const Text("Continue"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Create a Vehicle object with current values
                            Vehicle vehicle = Vehicle(
                              brand: _brandController.text,
                              model: _modelController.text,
                              year: int.parse(_yearController.text),
                              mileage: int.parse(_kmDrivenController.text),
                              ownershipCount: int.parse(_ownersController.text),
                              title: _adTitleController.text,
                              description: _descriptionController.text,
                              rcNumber: _registrationNoController.text,
                              vinNumber: _vinController.text,
                              price: double.parse(_priceController.text),
                              category: 'SUV',
                              transmission: 'Manual',
                              fuelType: 'Petrol',
                              isPremium: false,
                              ownerId: auth.currentUser!.uid,
                              datePosted: DateTime.now(),
                              location: 'Kerala',
                              images: [],
                            );
                            MHelperFunctions.navigateToScreen(
                              context,
                              VehicleImageSelectScreen(
                                vehicle: vehicle, rcImagePath: widget.rcImagePath ,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
