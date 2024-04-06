import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  //   required this.onPressed-add later
  const SmallButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MHelperFunctions.screenWidth() * 0.39, 60.0),
      ),
      child: child,
    );
  }
}

class LargeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const LargeButton({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MHelperFunctions.screenWidth() * 0.85, 60.0)),
      child: child,
    );
  }
}

class LargeButtonNS extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const LargeButtonNS({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: child,
    );
  }
}

class LargeSecButtonWithIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final String icon;

  const LargeSecButtonWithIcon(
      {super.key, required this.child, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: MSizes.sm,
        ),
        child
      ]),
    );
  }
}

class LargeSecButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const LargeSecButton({super.key, required this.child,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: child,
    );
  }
}

class SmallSecButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  //   required this.onPressed-add later
  const SmallSecButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MHelperFunctions.screenWidth() * 0.39, 60.0),
      ),
      child: child,
    );
  }
}