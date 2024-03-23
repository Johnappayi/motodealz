import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class MLoaders {
  static void warningSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: MColors.primary,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
