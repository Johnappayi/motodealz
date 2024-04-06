import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.label,
    this.isEnabled
  });
  final String hintText;
  final String label;
  final bool? isEnabled;
  

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
          enabled: isEnabled ?? true,
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon, this.onChanged,
  });

  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final ValueChanged<String>? onChanged; 

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
           onChanged: onChanged, 
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(MSizes.inputFieldRadius),
              borderSide:
                  BorderSide(width: 0, color: MColors.primary.withOpacity(0)),
            ),
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(MSizes.nm),
                    child: SvgPicture.asset(
                      suffixIcon!,
                      colorFilter: MSvgStyle.svgStyle2(darkMode),
                    ),
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(MSizes.nm),
                    child: SvgPicture.asset(
                      prefixIcon!,
                      colorFilter: MSvgStyle.svgStyle2(darkMode),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class InputFieldWithIcon extends StatelessWidget {
  const InputFieldWithIcon({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.controller,
    this.validator,
    this.obscureText,
    this.onSuffixIconPressed,
  });

  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? label; // Making label nullable
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final void Function()? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    final bool finalObscureText = obscureText ?? false;
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
          validator: validator,
          controller: controller,
          obscureText: finalObscureText ,
          decoration: InputDecoration(
            enabled: true,
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixIconPressed,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: MSizes.nm, horizontal: MSizes.sm),
                      child: SvgPicture.asset(
                        suffixIcon!,
                        colorFilter: MSvgStyle.svgStyle2(darkMode),
                      ),
                    ),
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(MSizes.nm),
                    child: SvgPicture.asset(
                      prefixIcon!,
                      colorFilter: MSvgStyle.svgStyle2(darkMode),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
