import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class CarCategoryItem extends StatelessWidget {
  const CarCategoryItem({
    super.key,
    required this.darkMode,
    required this.icon,
    required this.type,
    required this.onPressed,
  });

  final bool darkMode;
  final String icon;
  final String type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(icon, colorFilter: MSvgStyle.svgStyle(darkMode)),
          const SizedBox(width: 12),
          Text(
            type,
            style: MFonts.fontCB2,
          ),
        ],
      ),
    );
  }
}
