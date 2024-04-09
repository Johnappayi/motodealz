import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class MOutlinedButtonTheme {
  MOutlinedButtonTheme._(); //To avoid creating instances
  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: MColors.surface,
      foregroundColor: MColors.primary,
      side: const BorderSide(color: MColors.primary2Light),
      textStyle: const TextStyle(
          fontSize: 20, color: MColors.primary, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: MSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MSizes.nm)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: MColors.surfaceDark,
      foregroundColor: MColors.secondary,
      side: const BorderSide(color: MColors.secondary),
      textStyle: const TextStyle(
          fontSize: 20, color: MColors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: MSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MSizes.nm)),
    ),
  );
}
