import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class MTextBtnTheme {
  MTextBtnTheme._();//To avoid creating instances

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.primary,
      disabledForegroundColor: Colors.grey,
      textStyle: MFonts.fontCH4,
    )
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.secondary,
      disabledForegroundColor: Colors.grey,
      textStyle: MFonts.fontCH4,
    )
  );
}