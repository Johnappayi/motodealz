import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class MNavigationBarTheme {
  MNavigationBarTheme._(); //To avoid creating instances

  static final lightNavigationBarTheme = NavigationBarThemeData(
    height: 80,
    backgroundColor: MColors.card,
    labelTextStyle: MaterialStatePropertyAll(MFonts.fontCB3.copyWith(color: MColors.primary)),
    indicatorColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll( Colors.transparent),
  
  );
  static final darkNavigationBarTheme = NavigationBarThemeData(
    height: 80,
    backgroundColor: MColors.black,
    labelTextStyle: MaterialStatePropertyAll(MFonts.fontCB3.copyWith(color: MColors.secondary)),
    indicatorColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll( Colors.transparent),
    
  );
}
