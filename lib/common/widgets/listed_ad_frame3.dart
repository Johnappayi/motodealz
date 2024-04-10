import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';

class ListedAdFrame3 extends StatelessWidget {
  const ListedAdFrame3({
    super.key,
    required this.vehicle,
    required this.onPressed,
  });



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
               FutureBuilder<String>(
                        future: MHttpHelper.convertGCSUrlToHttps(
                            vehicle.images.isNotEmpty ? vehicle.images[0] : ''),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Image.asset(
                                darkMode
                                    ? MImages.sampleCarDarkMode
                                    : MImages.sampleCar,
                                width: MHelperFunctions.screenWidth() ,
                                height: MHelperFunctions.screenHeight() * 0.17,
                                fit: BoxFit.cover,
                              );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Image.network(
                              snapshot.data ?? '',
                              width: MHelperFunctions.screenWidth(),
                              height: MHelperFunctions.screenHeight() * 0.17,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                     
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                      width: MHelperFunctions.screenWidth() * 0.28,
                      decoration: BoxDecoration(
                        color: darkMode
                            ? MColors.surfaceDark.withOpacity(0.6)
                            : MColors.surface.withOpacity(0.8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MSizes.md, vertical: MSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                           '${vehicle.brand} ${vehicle.model}',
                            style: MFonts.fontCH4.copyWith(
                                color: darkMode ? MColors.white : MColors.black),
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
                                        darkMode ? MColors.white : MColors.black),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                MImages.arrowRIcon,
                                colorFilter: MSvgStyle.svgStyle(darkMode),
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
