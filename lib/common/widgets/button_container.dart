import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final String child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(MSizes.sm),
        decoration: BoxDecoration(
          color: darkMode ? MColors.secondary : MColors.card,
          borderRadius: const BorderRadius.all(
            Radius.circular(MSizes.borderRadiusLg),
          ),
        ),
        width: 35,
        height: 35,
        child: SvgPicture.asset(
          child,
          colorFilter: MSvgStyle.svgStyle(darkMode),
        ),
      ),
    );
  }
}
