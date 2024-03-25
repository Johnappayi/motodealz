import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MSideBar extends StatelessWidget {
  final VoidCallback onClose;

  const MSideBar({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(MSizes.defaultSpace),
      width: MHelperFunctions.screenWidth() * 0.77, // Adjust the width as needed
      color: darkMode
          ? MColors.cardDark
          : MColors.surface, // Adjust the background color as needed
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonContainer(
                onPressed: onClose,
                child: MImages.closeIcon,
              )
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          const Text("GENERAL SETTING", style: MFonts.fontAH1),
          const SizedBox(height: MSizes.defaultSpace),
          const SizedBox(height: MSizes.defaultSpace),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(MImages.permissionIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  const Text(
                    "Permissions",
                    style: MFonts.fontCH3,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(MImages.arrowRIcon,
                  colorFilter: MSvgStyle.svgStyle(darkMode))
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(MImages.reportIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  const Text(
                    "Report an issues",
                    style: MFonts.fontCH3,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(MImages.arrowRIcon,
                  colorFilter: MSvgStyle.svgStyle(darkMode))
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(MImages.faqIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  const Text(
                    "FAQ",
                    style: MFonts.fontCH3,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(MImages.arrowRIcon,
                  colorFilter: MSvgStyle.svgStyle(darkMode))
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(MImages.privacyIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  const Text(
                    "Privacy Policies",
                    style: MFonts.fontCH3,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(MImages.arrowRIcon,
                  colorFilter: MSvgStyle.svgStyle(darkMode))
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(MImages.aboutIcon,
                      colorFilter: MSvgStyle.svgStyle(darkMode)),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  const Text(
                    "About",
                    style: MFonts.fontCH3,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(MImages.arrowRIcon,
                  colorFilter: MSvgStyle.svgStyle(darkMode))
            ],
          ),
          const SizedBox(height: MSizes.defaultSpace),
          const SizedBox(height: MSizes.defaultSpace),
          const Text("Version 1.0",style: MFonts.fontCB2)
        ],
      ),
    );
  }
}
