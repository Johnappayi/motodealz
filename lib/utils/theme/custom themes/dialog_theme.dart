import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class MDialogBoxTheme {
  MDialogBoxTheme._();

  static final lightDialogBoxTheme = DialogTheme(
    backgroundColor: const Color.fromARGB(255, 92, 141, 159),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
    ),
    contentTextStyle: MFonts.fontCB2b.copyWith(color: MColors.lightGrey),
    titleTextStyle: MFonts.fontCH2.copyWith(color: MColors.white),
  );
  static final darkDialogBoxTheme = DialogTheme(
      backgroundColor: MColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      ),
      contentTextStyle: MFonts.fontCB2b.copyWith(color: MColors.darkGrey),
      titleTextStyle: MFonts.fontCH2.copyWith(color: MColors.black));
}
