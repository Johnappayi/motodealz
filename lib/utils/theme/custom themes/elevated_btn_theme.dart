import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class MElevatedBtnTheme {
  MElevatedBtnTheme._();//To avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.white,
      backgroundColor: MColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: MColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white ,fontWeight: FontWeight.w600 ,fontFamily: 'lato' ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.white,
      backgroundColor: MColors.secondary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: MColors.secondary,),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 20, color: MColors.black ,fontWeight: FontWeight.w600 ,fontFamily: 'lato' ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
}