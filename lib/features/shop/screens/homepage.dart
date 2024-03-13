import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/car_category_item.dart';
import 'package:motodealz/common/widgets/listed_ad_frame1.dart';
import 'package:motodealz/features/shop/screens/vehicle_image_veiw_page.dart';
import 'package:motodealz/features/shop/screens/vehicle_view_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Column(
        children: [
          const MAppBar(),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(MSizes.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                      ? MColors.cardDark
                                      : MColors.card,
                                  borderRadius: BorderRadius.circular(
                                      MSizes.cardRadiusMd)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.sedanIcon,
                                          type: 'Sedan',),
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.hatchbackIcon,
                                          type: 'Hatchback',)
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.suvIcon,
                                          type: 'SUV',
                                          ),
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.muvIcon,
                                          type: 'MUV',
                                          )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.coupeIcon,
                                          type: 'Coupe',),
                                      CarCategoryItem(
                                          darkMode: darkMode,
                                          icon: MImages.pickupIcon,
                                          type: 'Pickup',
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ), // Example Text Widget 2
                          ],
                        ),
                        const SizedBox(
                          height: MSizes.sm,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "Choose your location",
                                style: MFonts.fontCB3,
                              ),
                              SvgPicture.asset(MImages.locationIcon,
                                  colorFilter: MSvgStyle.svgStyle(darkMode)),
                            ]),
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
                            ), // Example Text Widget 1
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: true,
                                ),
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: MSizes.sm,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                              ],
                            ), // Example Text Widget 2
                            const SizedBox(
                              height: MSizes.sm,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                                ListedAdFrame1(
                                  onPressed: () {
                                            // Navigate to a different page
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VehicleVeiwScreen()),
                                            );
                                          },
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
