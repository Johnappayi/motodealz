import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ListedAdFrame3 extends StatelessWidget {
  const ListedAdFrame3({
    super.key,
    required this.carName,
    required this.price,
    required this.year,
    required this.mileage,
  });

  final String carName;
  final String price;
  final String year;
  final String mileage;


  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Container(
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(
      //       color: darkMode ? MColors.shadowDark : MColors.shadowLight,
      //       blurRadius: 10.0,
      //       offset: const Offset(2, 2)),
      // ]),
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
                  height: MHelperFunctions.screenHeight() * 0.17,
                  width: MHelperFunctions.screenWidth(),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                      width: MHelperFunctions.screenWidth() * 0.28,
                      decoration: BoxDecoration(
                        color:  darkMode ? MColors.surface.withOpacity(0.6) : MColors.surfaceDark.withOpacity(0.8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal:  MSizes.md, vertical: MSizes.sm),
                      child: Column(
                        children: [
                          Text(
                            carName,
                            style: MFonts.fontCH4.copyWith(color: darkMode ? MColors.black: MColors.white),
                          ),
                          const SizedBox(
                            height: MSizes.sm,
                          ),
                          Row(
                            children: [
                              Text(
                                year,
                                style: MFonts.fontCB4.copyWith(color: darkMode ? MColors.black: MColors.white),
                              ),
                              const Spacer(),
                              SvgPicture.asset(MImages.arrowRIcon,colorFilter: MSvgStyle.svgStyleInv(darkMode),)
                            ],
                          ),
                          
                      ],
                      )),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
