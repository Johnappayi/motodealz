import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleDetailsUI extends StatelessWidget {
  const VehicleDetailsUI({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: Column(
        children: [
          Text(
            '${vehicle.brand} ${vehicle.model}',
            style: MFonts.fontBH1,
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                vehicle.year.toString(),
                style: MFonts.fontCH3,
              ),
              Text(
                "|",
                style: const TextStyle().copyWith(color: MColors.primary2Light),
              ),
              Text(
                vehicle.fuelType,
                style: MFonts.fontCH3,
              ),
              const Text("|"),
              Text(
                vehicle.transmission,
                style: MFonts.fontCH3,
              ),
              const Text("|"),
              Text(
                MFormatter.formatMileage(vehicle.mileage),
                style: MFonts.fontCH3,
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(MImages.ownershipIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.sm),
                  Text(
                    MFormatter.formatOwnership(vehicle.ownershipCount),
                    style: MFonts.fontCB2b,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    vehicle.location,
                    style: MFonts.fontCB2b,
                  ),
                  const SizedBox(width: MSizes.sm),
                  SvgPicture.asset(MImages.locationIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.nm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Posted on ${MFormatter.formatDate(vehicle.datePosted)}',
                  style: MFonts.fontCB3.copyWith(color: MColors.lightGrey)),
              Text("Ad ID: ${vehicle.ownerId.substring(0,6)}",
                  style: MFonts.fontCB3.copyWith(color: MColors.lightGrey)),
            ],
          ),
          const SizedBox(
            height: MSizes.defaultSpace,
          ),
          const Row(
            children: [
              Text(
                "Description",
                style: MFonts.fontCH4,
              ),
            ],
          ),
          const SizedBox(
            height: MSizes.sm,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: darkMode ? MColors.surfaceDark : MColors.surface,
                borderRadius: BorderRadius.circular(MSizes.cardRadiusLg)),
            padding: const EdgeInsets.all(MSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.title, //include title later
                  style: MFonts.fontCB2b,
                ),
                const SizedBox(
                  height: MSizes.sm,
                ),
                Text(
                  vehicle.description,
                  style: MFonts.fontCB2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
