import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class MTextFormFieldTheme {
  MTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: MColors.card,
    errorMaxLines: 3,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    constraints: const BoxConstraints.expand(height: MSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: MColors.primary.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: MColors.primary.withOpacity(0.7)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide:  BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: MColors.cardDark,
    errorMaxLines: 3,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    constraints: const BoxConstraints.expand(height: MSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeMd, color: MColors.secondary.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: MSizes.fontSizeSm, color: MColors.secondary.withOpacity(0.7)),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide:  BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide:  BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );
}
