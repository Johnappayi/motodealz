import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/car_category_item.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/listed_ad_frame2.dart';
import 'package:motodealz/common/widgets/popular_brand_container.dart';
import 'package:motodealz/common/widgets/side_bar.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/features/shop/screens/vehicle_view_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/device/device_utility.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSideBarOpen = false;
  final _vehicleController = Get.put(VehicleController());
  bool _showResults = false;
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
              Padding(
                padding: const EdgeInsets.only(
                    left: MSizes.lg, right: MSizes.lg, bottom: MSizes.nm),
                child: SearchField(
                  prefixIcon: MImages.searchBarIcon,
                  hintText: 'What are you looking for!',
                  onChanged: (query) {
                    setState(() {
                      // Filter vehicles based on the search query
                      _vehicles = _vehicleController.searchVehicles(query);
                      // Hide popular brands when user starts searching
                      _showResults = true;
                    });
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        // Add constraints to the Container
                        minHeight: MDeviceUtils.getScreenHeight()),
                    child: Padding(
                      padding: const EdgeInsets.all(MSizes.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_showResults) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Browse Categories",
                                  style: MFonts.fontBH1,
                                ), // Example Text Widget 1
                                Container(
                                  padding: const EdgeInsets.all(MSizes.md),
                                  decoration: BoxDecoration(
                                      color: darkMode
                                          ? MColors.surfaceDark
                                          : MColors.surface,
                                      borderRadius: BorderRadius.circular(
                                          MSizes.cardRadiusMd)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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

                                                _showResults = true;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: MSizes.nm,
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
                                                _showResults = true;
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
                                                    .getVehiclesByCategory(
                                                        'SUV');
                                                _showResults = true;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: MSizes.nm,
                                          ),
                                          CarCategoryItem(
                                            darkMode: darkMode,
                                            icon: MImages.muvIcon,
                                            type: 'MUV',
                                            onPressed: () {
                                              setState(() {
                                                // Update the list of vehicles based on the selected category
                                                _vehicles = _vehicleController
                                                    .getVehiclesByCategory(
                                                        'MUV');
                                                _showResults = true;
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
                                                _showResults = true;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: MSizes.nm,
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
                                                _showResults = true;
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
                          ],
                          if (!_showResults) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Popular Brands",
                                  style: MFonts.fontBH1,
                                ),
                                const SizedBox(
                                  height: MSizes.md,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      PopularBrandContainer(
                                        icon: MImages.bmwLogo,
                                        onPressed: () {
                                          setState(() {
                                            // Update the list of vehicles based on the selected category
                                            _vehicles = _vehicleController
                                                .getVehiclesByBrand('bmw');
                                            _showResults = true;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: MSizes.nm,
                                      ),
                                      PopularBrandContainer(
                                        icon: MImages.benzLogo,
                                        onPressed: () {
                                          setState(() {
                                            // Update the list of vehicles based on the selected category
                                            _vehicles = _vehicleController
                                                .getVehiclesByBrand('mercedes');
                                            _showResults = true;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: MSizes.nm,
                                      ),
                                      PopularBrandContainer(
                                        icon: MImages.volkswagenLogo,
                                        onPressed: () {
                                          setState(() {
                                            // Update the list of vehicles based on the selected category
                                            _vehicles = _vehicleController
                                                .getVehiclesByBrand(
                                                    'volkswagen');
                                            _showResults = true;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: MSizes.nm,
                                      ),
                                      PopularBrandContainer(
                                        icon: MImages.mahindraLogo,
                                        onPressed: () {
                                          setState(() {
                                            // Update the list of vehicles based on the selected category
                                            _vehicles = _vehicleController
                                                .getVehiclesByBrand('mahindra');
                                            _showResults = true;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: MSizes.nm,
                                      ),
                                      PopularBrandContainer(
                                        icon: MImages.tataLogo,
                                        onPressed: () {
                                          setState(() {
                                            // Update the list of vehicles based on the selected category
                                            _vehicles = _vehicleController
                                                .getVehiclesByBrand('tata');
                                            _showResults = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ), // Example Text Widget 2
                              ],
                            ),
                            const SizedBox(
                              height: MSizes.defaultSpace,
                            ),
                          ],
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _showResults
                                    ? (_vehicles.isEmpty
                                            ? null
                                            : "Search Results") ??
                                        ""
                                    : "Top Recommendations",
                                style: MFonts.fontBH1,
                              ),
                              const SizedBox(
                                height: MSizes.md,
                              ),
                              if (_showResults && _vehicles.isEmpty) ...[
                                SizedBox(
                                  height:
                                      MHelperFunctions.screenHeight() * 0.55,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(MImages.noResultImg),
                                        const SizedBox(
                                          height: MSizes.defaultSpace,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MSizes.defaultSpace),
                                          child: Text(
                                            "Looks like we’ve got nothing at the moment",
                                            style: MFonts.fontCH4,
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, // Number of columns
                                  mainAxisSpacing: MSizes.sm,
                                  childAspectRatio: 378 / 200,
                                ),
                                itemCount: _vehicles.length,
                                itemBuilder: (context, index) {
                                if (_vehicles.isEmpty) {
                                    return const CustomIndicator(); // or any other loading indicator
                                  } else {

                                    return ListedAdFrame2(
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
                              ),
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
