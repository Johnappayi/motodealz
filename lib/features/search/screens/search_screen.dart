import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/car_category_item.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/listed_ad_frame2.dart';
import 'package:motodealz/common/widgets/popular_brand_container.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                        const InputFieldWithIcon(
                          prefixIcon: MImages.searchBarIcon,
                          hintText: 'What are you looking for!',
                        ),
                        const SizedBox(
                          height: MSizes.defaultSpace,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Select Category",
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
                                        type: 'Sedan',
                                      ),
                                      CarCategoryItem(
                                        darkMode: darkMode,
                                        icon: MImages.hatchbackIcon,
                                        type: 'Hatchback',
                                      )
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
                                        type: 'Coupe',
                                      ),
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
                          height: MSizes.defaultSpace,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Popular Brands",
                              style: MFonts.fontBH1,
                            ),
                            SizedBox(
                              height: MSizes.md,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  PopularBrandContainer(icon: MImages.bmwLogo),
                                  SizedBox(width: MSizes.nm,),
                                  PopularBrandContainer(icon: MImages.bmwLogo),
                                  SizedBox(width: MSizes.nm,),
                                  PopularBrandContainer(icon: MImages.bmwLogo),
                                  SizedBox(width: MSizes.nm,),
                                  PopularBrandContainer(icon: MImages.bmwLogo),
                                  SizedBox(width: MSizes.nm,),
                                  PopularBrandContainer(icon: MImages.bmwLogo),
                                ],
                              ),
                            ), // Example Text Widget 2
                          ],
                        ),
                        const SizedBox(
                          height: MSizes.defaultSpace,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recommended for you ",
                              style: MFonts.fontBH1,
                            ),
                            SizedBox(
                              height: MSizes.md,
                            ), // Example Text Widget 1
                            Column(
                              children: [
                                ListedAdFrame2(
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: true,
                                ),
                                SizedBox(
                                  height: MSizes.lg,
                                ),
                                ListedAdFrame2(
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: true,
                                ),
                                SizedBox(
                                  height: MSizes.lg,
                                ),
                                ListedAdFrame2(
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                                SizedBox(
                                  height: MSizes.lg,
                                ),
                                ListedAdFrame2(
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                                SizedBox(
                                  height: MSizes.lg,
                                ),
                                ListedAdFrame2(
                                  carName: 'Corola Altis',
                                  year: '2000',
                                  mileage: '2,50,000km',
                                  price: 'Rs. 4,50,000',
                                  isPremium: false,
                                ),
                                SizedBox(
                                  height: MSizes.lg,
                                ),
                                ListedAdFrame2(
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

