import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class MTextTheme {
  MTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: MFonts.fontAH1.copyWith(color: MColors.dark),
    headlineMedium: const TextStyle().copyWith(color: MColors.dark),
    headlineSmall: const TextStyle().copyWith(color: MColors.dark),

    titleLarge: const TextStyle().copyWith(color: MColors.dark),
    titleMedium: const TextStyle().copyWith(color: MColors.dark),
    titleSmall: const TextStyle().copyWith(color: MColors.dark),

    bodyLarge: const TextStyle().copyWith(color: MColors.dark),
    bodyMedium: const TextStyle().copyWith(color: MColors.dark),
    bodySmall: const TextStyle().copyWith(color: MColors.dark.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(color: MColors.dark),
    labelMedium: const TextStyle().copyWith(color: MColors.dark.withOpacity(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge:  MFonts.fontAH1.copyWith(color: MColors.light),
    headlineMedium: const TextStyle().copyWith(color: MColors.light),
    headlineSmall: const TextStyle().copyWith(color: MColors.light),

    titleLarge: const TextStyle().copyWith(color: MColors.light),
    titleMedium: const TextStyle().copyWith(color: MColors.light),
    titleSmall: const TextStyle().copyWith(color: MColors.light),

    bodyLarge: const TextStyle().copyWith(color: MColors.light),
    bodyMedium: const TextStyle().copyWith(color: MColors.light),
    bodySmall: const TextStyle().copyWith(color: MColors.light.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(color: MColors.light),
    labelMedium: const TextStyle().copyWith(color: MColors.light.withOpacity(0.5)),
  );
}


