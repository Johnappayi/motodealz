import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class PopularBrandContainer extends StatelessWidget {
  final String icon;

  const PopularBrandContainer({
    super.key,
    required this.icon
  });
  
  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Container(
        width: MHelperFunctions.screenWidth() * 0.2,
        height: MHelperFunctions.screenWidth() * 0.2,
        padding: const EdgeInsets.all(MSizes.sm),
        decoration: BoxDecoration(
            color: darkMode ? MColors.cardDark : MColors.card,
            borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
        child: Image.asset(icon));
  }
}
