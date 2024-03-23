import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/utils/constants/image_strings.dart';

class MBackButton extends StatelessWidget {
  const MBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
        onPressed: () {
          Navigator.pop(context);
        },
        child: MImages.backIcon);
  }
}
