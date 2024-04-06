import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';

class ListedAdFrame1 extends StatelessWidget {
  const ListedAdFrame1({
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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
              boxShadow: [
                BoxShadow(
                  color: darkMode ? MColors.shadowDark : MColors.shadowLight,
                  blurRadius: 10.0,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
                  child: SizedBox(
                    width: MHelperFunctions.screenWidth() * 0.42,
                    child: Column(
                      children: [
                        FutureBuilder<String>(
                          future: MHttpHelper.convertGCSUrlToHttps(
                              vehicle.images.isNotEmpty
                                  ? vehicle.images[0]
                                  : ''),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                width: MHelperFunctions.screenWidth() * 0.42,
                                height: MHelperFunctions.screenHeight() * 0.15,
                                child: const CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Image.network(
                                snapshot.data ?? '',
                                height: MHelperFunctions.screenHeight() * 0.15,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(MSizes.cardRadiusLg),
                              bottomRight: Radius.circular(MSizes.cardRadiusLg),
                            ),
                            border: vehicle.isPremium
                                ? null
                                : Border(
                                    left: BorderSide(
                                      color: darkMode
                                          ? MColors.shadowDark
                                          : MColors.primary2Light,
                                    ),
                                    right: BorderSide(
                                      color: darkMode
                                          ? MColors.shadowDark
                                          : MColors.primary2Light,
                                    ),
                                    bottom: BorderSide(
                                      color: darkMode
                                          ? MColors.shadowDark
                                          : MColors.primary2Light,
                                    ),
                                  ),
                            color: vehicle.isPremium
                                ? (darkMode ? MColors.cardDark : MColors.card)
                                : (darkMode
                                    ? MColors.surfaceDark
                                    : MColors.surface),
                          ),
                          padding: const EdgeInsets.all(MSizes.nm),
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    '${vehicle.brand} ${vehicle.model}',
                                    style: MFonts.fontCB2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  vehicle.year.toString(),
                                  style: MFonts.fontCB4,
                                ),
                              ]),
                              const SizedBox(
                                height: MSizes.sm,
                              ),
                              Row(children: [
                                Text(
                                  MFormatter.formatCurrency(vehicle.price),
                                  style: MFonts.fontCB2b,
                                ),
                                const Spacer(),
                                Text(
                                  MFormatter.formatMileage(vehicle.mileage),
                                  style: MFonts.fontCB4,
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
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
