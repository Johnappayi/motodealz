import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          Image.asset(icon, height: 18),
          const SizedBox(width: 4),
          Text(
            type,
            style: MFonts.fontCB2,
          ),
        ],
      ),
    );
  }
}
