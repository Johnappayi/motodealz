import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class MElevatedBtnTheme {
  MElevatedBtnTheme._();//To avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.white,
      backgroundColor: MColors.primary,
      disabledForegroundColor: MColors.white.withOpacity(0.5),
      disabledBackgroundColor: MColors.primary.withOpacity(0.5),
      side: const BorderSide(color: MColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white ,fontWeight: FontWeight.w600 ,fontFamily: 'lato' ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MSizes.nm)),
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MColors.white,
      backgroundColor: MColors.secondary,
      disabledForegroundColor: MColors.white.withOpacity(0.5),
      disabledBackgroundColor: MColors.secondary.withOpacity(0.2),
      side: const BorderSide(color: MColors.secondary,),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 20, color: MColors.black ,fontWeight: FontWeight.w600 ,fontFamily: 'lato' ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MSizes.nm)),
    )
  );
}