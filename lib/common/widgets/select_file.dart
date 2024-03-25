import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SelectFile extends StatelessWidget {
  const SelectFile({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = MHelperFunctions.isDarkMode(context);
    return Container(
      width: MHelperFunctions.screenWidth(),
      height: MHelperFunctions.screenHeight() * 0.25,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.5,
            color: darkmode ? MColors.darkerGrey : MColors.primary2Light),
        color: darkmode ? MColors.surfaceDark : MColors.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(MSizes.borderRadiusLg),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            MImages.galeryIcon,
          ),
          const SizedBox(
            height: MSizes.nm,
          ),
          Text(
            "Select file",
            style: MFonts.fontCH4.copyWith(
                color: darkmode ? MColors.darkGrey : MColors.lightGrey),
          )
        ],
      ),
    );
  }
}
