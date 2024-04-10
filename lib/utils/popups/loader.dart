import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static successSnackBar({required title, message = ''}) {
    final darkmode = MHelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: darkmode ? MColors.black : MColors.white,
      backgroundColor: darkmode ? MColors.card : MColors.cardDark,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon:
          Icon(Iconsax.check, color: darkmode ? MColors.success : MColors.secondary),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    // final darkmode = MHelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: MColors.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    // final darkmode = MHelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MColors.white,
      backgroundColor: MColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.information, color: MColors.white),
    );
  }
}
