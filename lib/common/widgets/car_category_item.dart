import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class CarCategoryItem extends StatelessWidget {
  const CarCategoryItem({
    Key? key,
    required this.darkMode,
    required this.icon,
    required this.type,
  }) : super(key: key);

  final bool darkMode;
  final String icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, colorFilter: MSvgStyle.svgStyle(darkMode)),
        const SizedBox(width: 12),
        Text(
          type,
          style: MFonts.fontCB2,
        ),
      ],
    );
  }
}
