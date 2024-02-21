import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class MAppBarTheme {
  MAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MColors.primaryBackground,
    surfaceTintColor: MColors.primaryBackground,
    iconTheme: IconThemeData(color: MColors.black,size: 24),
    actionsIconTheme: IconThemeData(color: MColors.black,size: 24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600,color: MColors.black),
  );

   static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MColors.primaryBackground,
    surfaceTintColor: MColors.primaryBackground,
    iconTheme: IconThemeData(color: MColors.black,size: 24),
    actionsIconTheme: IconThemeData(color: MColors.white,size: 24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600,color: MColors.white),
  );
}
