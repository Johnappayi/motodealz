
import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class MSvgStyle {
  static ColorFilter svgStyle(bool darkMode) {
    return darkMode
        ? const ColorFilter.mode(MColors.white, BlendMode.srcIn)
        : const ColorFilter.mode(MColors.black, BlendMode.srcIn);
  }
  static ColorFilter svgStyle2(bool darkMode) {
    return darkMode
        ? ColorFilter.mode(MColors.secondary.withOpacity(0.7), BlendMode.srcIn)
        :  ColorFilter.mode(MColors.primary.withOpacity(0.7), BlendMode.srcIn);
  }
  static ColorFilter svgStyle3(bool darkMode) {
    return darkMode
        ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn)
        : const ColorFilter.mode(MColors.primary, BlendMode.srcIn);
  }
}
