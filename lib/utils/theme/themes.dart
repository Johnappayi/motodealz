import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/theme/custom%20themes/appbar_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/bottom_sheet_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/checkbox_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/chip_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/elevated_btn_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/navbar_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/outlined_btn_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/text_btn_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/text_feild_theme.dart';
import 'package:motodealz/utils/theme/custom%20themes/text_theme.dart';

class MAppTheme {
  MAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'lato',
    brightness: Brightness.light,
    primaryColor: MColors.primary,
    scaffoldBackgroundColor: MColors.primaryBackground,
    textTheme: MTextTheme.lightTextTheme,
    elevatedButtonTheme: MElevatedBtnTheme.lightElevatedButtonTheme,
    chipTheme: MChipTheme.lightChipTheme,
    appBarTheme: MAppBarTheme.lightAppBarTheme,
    checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: MNavigationBarTheme.lightNavigationBarTheme,
    textButtonTheme: MTextBtnTheme.lightTextButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'lato',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: MColors.darkerGrey,
    textTheme: MTextTheme.darkTextTheme,
    elevatedButtonTheme: MElevatedBtnTheme.darkElevatedButtonTheme,
    chipTheme: MChipTheme.darkChipTheme,
    appBarTheme: MAppBarTheme.darkAppBarTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: MNavigationBarTheme.darkNavigationBarTheme,
    textButtonTheme: MTextBtnTheme.darkTextButtonTheme,
  );
}
