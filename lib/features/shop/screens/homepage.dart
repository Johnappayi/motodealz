import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/car_category_item.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/common/widgets/listed_ad_frame1.dart';
import 'package:motodealz/common/widgets/side_bar.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/features/shop/screens/vehicle_view_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSideBarOpen = false;
  final _vehicleController = Get.put(VehicleController());
  late List<Vehicle> _vehicles = [];

  void _toggleSideBar() {
    setState(() {
      _isSideBarOpen = !_isSideBarOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadVehicles();
  }

  // Method to load vehicles asynchronously
  void _loadVehicles() async {
    try {
      List<Vehicle> vehicles = await _vehicleController.getAllVehicles();
      setState(() {
        _vehicles = vehicles; // Update _vehicles when data is fetched
      });
    } catch (error) {
      // print("Error loading vehicles: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              MAppBar(onMenuPressed: _toggleSideBar),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                      // Add constraints to the Container
                      minHeight: MediaQuery.of(context)
                          .size
                          .height, // Set minimum height
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(MSizes.lg),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Browse Categories",
                                style: MFonts.fontBH1,
                              ),
                              const SizedBox(height: MSizes.md), // Example Text Widget 1
                              Container(
                                padding: const EdgeInsets.all(MSizes.md),
                                decoration: BoxDecoration(
                                    color: darkMode
                                        ? MColors.surfaceDark
                                        : MColors.surface,
                                    borderRadius: BorderRadius.circular(
                                        MSizes.cardRadiusMd)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.sedanIcon,
                                          type: 'Sedan',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory(
                                                      'Sedan');
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: MSizes.md,
                                        ),
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.hatchbackIcon,
                                          type: 'Hatchback',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory(
                                                      'Hatchback');
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.suvIcon,
                                          type: 'SUV',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory('SUV');
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: MSizes.md,
                                        ),
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.muvIcon,
                                          type: 'MUV',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory('MUV');
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.coupeIcon,
                                          type: 'Coupe',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory(
                                                      'Coupe');
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: MSizes.md,
                                        ),
                                        CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.pickupIcon,
                                          type: 'Pickup',
                                          onPressed: () {
                                            setState(() {
                                              // Update the list of vehicles based on the selected category
                                              _vehicles = _vehicleController
                                                  .getVehiclesByCategory(
                                                      'Pickup');
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ), // Example Text Widget 2
                            ],
                          ),
                          const SizedBox(
                            height: MSizes.nm,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     const Text(
                          //       "Choose your location",
                          //       style: MFonts.fontCB3,
                          //     ),
                          //     SvgPicture.asset(MImages.locationIcon,
                          //         colorFilter: MSvgStyle.svgStyle(darkMode)),
                          //   ],
                          // ),
                          const SizedBox(
                            height: MSizes.md,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Top recommendations",
                                style: MFonts.fontBH1,
                              ),
                              const SizedBox(
                                height: MSizes.md,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing: MSizes.sm,
                                  mainAxisSpacing: MSizes.sm,
                                  childAspectRatio: 3 / 3.5,
                                ),
                                itemCount: _vehicles.length,
                                itemBuilder: (context, index) {
                                  if (_vehicles.isEmpty) {
                                    return const CustomIndicator(); // or any other loading indicator
                                  } else {
                                    return ListedAdFrame1(
                                      onPressed: () =>
                                          MHelperFunctions.navigateToScreen(
                                        context,
                                        VehicleVeiwScreen(
                                            vehicle: _vehicles[index]),
                                      ),
                                      vehicle: _vehicles[index],
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_isSideBarOpen) MSideBar(onClose: _toggleSideBar),
        ],
      ),
    );
  }
}
