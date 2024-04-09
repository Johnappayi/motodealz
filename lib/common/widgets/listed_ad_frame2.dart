import 'package:flutter/material.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/http/http_client.dart';

class ListedAdFrame2 extends StatelessWidget {
  const ListedAdFrame2({
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
      child: Column(
        children: [
          Container(
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
                                height: MHelperFunctions.screenHeight() * 0.22,
                                fit: BoxFit.cover,
                              );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Image.network(
                              snapshot.data ?? '',
                              width: MHelperFunctions.screenWidth(),
                              height: MHelperFunctions.screenHeight() * 0.22,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            height: MHelperFunctions.screenHeight() * 0.08,
                            decoration: BoxDecoration(
                              color: vehicle.isPremium
                                  ? (darkMode
                                      ? MColors.cardDark.withOpacity(0.8)
                                      : MColors.card.withOpacity(0.8))
                                  : (darkMode
                                      ? MColors.surfaceDark.withOpacity(0.8)
                                      : MColors.surface.withOpacity(0.8)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: MSizes.md, vertical: MSizes.sm),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Text(
                                    '${vehicle.brand} ${vehicle.model}',
                                    style: MFonts.fontCB1b,
                                  ),
                                  const Spacer(),
                                  Text(
                                    MFormatter.formatMileage(vehicle.mileage),
                                    style: MFonts.fontCB4,
                                  ),
                                ]),
                                Row(children: [
                                  Text(
                                    vehicle.year.toString(),
                                    style: MFonts.fontCB4,
                                  ),
                                  const Spacer(),
                                  Text(
                                    MFormatter.formatCurrency(vehicle.price),
                                    style: MFonts.fontCB1b,
                                  ),
                                ]),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                if (vehicle.isPremium)
                  Positioned(
                    top: -5,
                    left: 1,
                    child: Image.asset(MImages.premiumIcon),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
