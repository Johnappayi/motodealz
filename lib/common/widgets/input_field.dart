import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class InputFeild extends StatelessWidget {
  const InputFeild({
    super.key,
    required this.hintText,
    required this.label,
  });
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: MFonts.fontCH4,),
        const SizedBox(
          height: MSizes.sm,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}
