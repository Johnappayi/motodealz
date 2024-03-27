import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/features/shop/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ListedAdFrame3 extends StatelessWidget {
  const ListedAdFrame3({
    Key? key,
    required this.vehicle,
    required this.onPressed,
  }) : super(key: key);



  final Vehicle vehicle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
            // ignore: sized_box_for_whitespace
            child: Stack(
              children: [
                Image.asset(
                 vehicle.images[0],
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
                        color: darkMode
                            ? MColors.surface.withOpacity(0.6)
                            : MColors.surfaceDark.withOpacity(0.8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MSizes.md, vertical: MSizes.sm),
                      child: Column(
                        children: [
                          Text(
                           '${vehicle.brand} ${vehicle.model}',
                            style: MFonts.fontCH4.copyWith(
                                color: darkMode ? MColors.black : MColors.white),
                          ),
                          const SizedBox(
                            height: MSizes.sm,
                          ),
                          Row(
                            children: [
                              Text(
                                 vehicle.year.toString(),
                                style: MFonts.fontCB4.copyWith(
                                    color:
                                        darkMode ? MColors.black : MColors.white),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                MImages.arrowRIcon,
                                colorFilter: MSvgStyle.svgStyleInv(darkMode),
                              )
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
