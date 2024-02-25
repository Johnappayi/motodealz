import 'package:flutter/material.dart';
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
        minimumSize: Size(MHelperFunctions.screenWidth()*0.39, 60.0),
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
        minimumSize: Size(MHelperFunctions.screenWidth()*0.85, 60.0)
      ),
      child: child,
    );
  }
}
