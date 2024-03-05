import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SmallButton extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget child;
  //   required this.onPressed-add later
  const SmallButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MHelperFunctions.screenWidth() * 0.39, 60.0),
      ),
      child: child,
    );
  }
}

class LargeButton extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget child;

  const LargeButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MHelperFunctions.screenWidth() * 0.85, 60.0)),
      child: child,
    );
  }
}

class LargeButtonNS extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget child;

  const LargeButtonNS({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: child,
    );
  }
}

class LargeSecButtonWithIcon extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget child;
  final String icon;

  const LargeSecButtonWithIcon({Key? key, required this.child,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [SvgPicture.asset(icon),const SizedBox(width: MSizes.sm,),child]),
    );
  }
}


class LargeSecButton extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget child;

  const LargeSecButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0)),
      child: child,
    );
  }
}