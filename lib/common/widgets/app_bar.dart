import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MAppBar extends StatelessWidget {
  const MAppBar({super.key});
 
  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(MImages.burgerIcon , colorFilter: MSvgStyle.svgStyle(darkMode))),
        Image.asset(darkMode ? MImages.appBarLogoL : MImages.appBarLogoD),
        SizedBox(
          width: MHelperFunctions.screenWidth() * 0.1,
        ),
      ],
    );
  }
}
