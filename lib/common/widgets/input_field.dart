import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InputField extends StatelessWidget {
  const InputField({
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
        Text(
          label,
          style: MFonts.fontCH4,
        ),
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
class InputFieldWithIcon extends StatelessWidget {
  const InputFieldWithIcon({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.label, 
  }) : super(key: key);

  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? label; // Making label nullable

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) // Display label only if it's not null
          Text(
            label!, // Safe to use label directly here after null check
            style: MFonts.fontCH4,
          ),
        const SizedBox(
          height: MSizes.sm,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(MSizes.nm),
                    child: SvgPicture.asset(
                      suffixIcon!,
                      colorFilter: MSvgStyle.svgStyle2(darkMode),
                    ),
                  )
                : null,
            prefixIcon: 
            prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.all(MSizes.nm),
              child: SvgPicture.asset(
                prefixIcon!,
                colorFilter: MSvgStyle.svgStyle2(darkMode),
              ),
            ): null,
          ),
        ),
      ],
    );
  }
}
