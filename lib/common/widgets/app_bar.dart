import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/utils/constants/colors.dart';
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
            onPressed: () {}, icon: SvgPicture.asset(MImages.burgerIcon , colorFilter: darkMode ? const ColorFilter.mode(MColors.white, BlendMode.srcIn) : const ColorFilter.mode(MColors.black, BlendMode.srcIn))),
        Image.asset(darkMode ? MImages.appBarLogoL : MImages.appBarLogoD),
        SizedBox(
          width: MHelperFunctions.screenWidth() * 0.1,
        ),
      ],
    );
  }
}
