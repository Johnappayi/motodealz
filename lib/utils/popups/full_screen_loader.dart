import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/animation_loader.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
            color: MHelperFunctions.isDarkMode(Get.context!)
                ? MColors.dark
                : MColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 200),
                MAnimationLoaderWidget(text: text, animation: animation),
              ],
            )),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
