import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: Stack(
              children: [
                Image.asset(
                  MImages.sampleCar1,
                  height: MHelperFunctions.screenHeight() * 0.22,
                  width: MHelperFunctions.screenWidth(),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: MHelperFunctions.screenHeight() * 0.08,
                      decoration: BoxDecoration(
                        color: isPremium
                            ? (darkMode
                                ? MColors.cardDark.withOpacity(0.8)
                                : MColors.card.withOpacity(0.8))
                            : (darkMode
                                ? MColors.surfaceDark.withOpacity(0.8)
                                : MColors.surface.withOpacity(0.8)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal:  MSizes.md, vertical: MSizes.sm),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              carName,
                              style: MFonts.fontCB1b,
                            ),
                            const Spacer(),
                            Text(
                              mileage,
                              style: MFonts.fontCB4,
                            ),
                          ]),
                          
                          Row(children: [
                            Text(
                              year,
                              style: MFonts.fontCB4,
                            ),
                            const Spacer(),
                            Text(
                              price,
                              style: MFonts.fontCB1b,
                            ),
                          ]),
                        ],
                      )),
                ),
              ],
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
