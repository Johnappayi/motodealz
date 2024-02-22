import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class CarCategoryItem extends StatelessWidget {
  const CarCategoryItem({
    super.key,
    required this.darkMode,
    required this.icon,
    required this.type,
  });

  final bool darkMode;
  final String icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon,
            colorFilter: darkMode
                ? const ColorFilter.mode(MColors.white, BlendMode.srcIn)
                : const ColorFilter.mode(MColors.black, BlendMode.srcIn)),
        const SizedBox(width: 12),
        Text(
          type,
          style: MFonts.fontCB2,
        ),
      ],
    );
  }
}
