import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

/// A widget for displaying an animated loading indicator with optional text and action button
class MAnimationLoaderWidget extends StatelessWidget {
  const MAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  // final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: MSizes.defaultSpace),
          const SizedBox(height: MSizes.defaultSpace),
          const SizedBox(height: MSizes.defaultSpace),
          const SizedBox(height: MSizes.defaultSpace),
          Image.asset(animation, width: MHelperFunctions.screenWidth()*0.125,),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
