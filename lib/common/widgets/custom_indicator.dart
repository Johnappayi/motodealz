import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: MColors.primary ,
      backgroundColor: MColors.secondary,
    ));
  }
}
