import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class PopularBrandContainer extends StatelessWidget {
  const PopularBrandContainer({
    super.key,
    required this.icon, required this.onPressed
  });
   final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: MHelperFunctions.screenWidth() * 0.2,
          height: MHelperFunctions.screenWidth() * 0.2,
          padding: const EdgeInsets.all(MSizes.sm),
          decoration: BoxDecoration(
              color: darkMode ? MColors.surfaceDark : MColors.surface,
              borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
          child: Image.asset(icon)),
    );
  }
}
