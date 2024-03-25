import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class MTextStyles {
  MTextStyles._();

  static TextStyle tabHead(bool isSelected, bool isDarkMode) {
    if (isDarkMode) {
      return TextStyle(
        color: isSelected ? MColors.secondary : MColors.textSecondary,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );
    } else {
      // Define your light mode text style here
      return TextStyle(
        color: isSelected ? MColors.primary : MColors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );
    }
  }
}
