import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ListedAdFrame2 extends StatelessWidget {
  const ListedAdFrame2({
    super.key,
    required this.carName,
    required this.price,
    required this.year,
    required this.mileage,
    required this.isPremium,
  });

  final String carName;
  final String price;
  final String year;
  final String mileage;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: darkMode ? MColors.shadowDark : MColors.shadowLight,
            blurRadius: 10.0,
            offset: const Offset(2, 2)),
      ]),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    MImages.sampleCar1,
                    fit: BoxFit.cover,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: isPremium
                            ? (darkMode ? MColors.cardDark : MColors.card)
                            : (darkMode
                                ? MColors.surfaceDark
                                : MColors.surface),
                      ),
                      padding: const EdgeInsets.all(MSizes.md),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              carName,
                              style: MFonts.fontCB2,
                            ),
                            const Spacer(),
                            Text(
                              year,
                              style: MFonts.fontCB4,
                            ),
                          ]),
                          const SizedBox(
                            height: MSizes.sm,
                          ),
                          Row(children: [
                            Text(
                              price,
                              style: MFonts.fontCB2b,
                            ),
                            const Spacer(),
                            Text(
                              mileage,
                              style: MFonts.fontCB4,
                            ),
                          ]),
                        ],
                      ))
                ],
              ),
            ),
          ),
          if (isPremium)
            Positioned(
                top: -5, left: 1, child: Image.asset(MImages.premiumIcon)),
        ],
      ),
    );
  }
}
