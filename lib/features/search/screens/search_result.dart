import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/listed_ad_frame2.dart';
import 'package:motodealz/common/widgets/side_bar.dart';
import 'package:motodealz/features/shop/controller/vehicle_controller.dart';
import 'package:motodealz/features/shop/model/vehicle_model.dart';
import 'package:motodealz/features/shop/screens/vehicle_view_page.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/device/device_utility.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSideBarOpen = false;
  final VehicleController _vehicleController = VehicleController();
  late List<Vehicle> _vehicles;
  bool _showResults = false;

  void _toggleSideBar() {
    setState(() {
      _isSideBarOpen = !_isSideBarOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _vehicles = _vehicleController.getAllVehicles();
  }

  @override
  Widget build(BuildContext context) {
    MHelperFunctions.isDarkMode(context);
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
                          const Text(
                            "Search Results",
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
                              return ListedAdFrame2(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VehicleVeiwScreen(
                                        vehicle: _vehicles[index],
                                      ),
                                    ),
                                  );
                                },
                                vehicle: _vehicles[index],
                              );
                            },
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
