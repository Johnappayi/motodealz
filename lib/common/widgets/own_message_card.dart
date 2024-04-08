import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.message, required this.time});
  final String message;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              MHelperFunctions.getFormattedTime(time).toLowerCase(),
              style: MFonts.fontCB2.copyWith(color: MColors.lightGrey),
            ),
            Container(
              decoration: BoxDecoration(
                color: darkMode ? MColors.primary2Dark : const Color.fromARGB(255, 96, 182, 175),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(MSizes.cardRadiusSm),
                  bottomLeft: Radius.circular(MSizes.cardRadiusSm),
                  bottomRight: Radius.zero, // Sharp bottom-right corner
                  topRight: Radius.circular(MSizes.cardRadiusSm),
                ), // Adjust as needed
                boxShadow:  [
                  BoxShadow(
                      color:
                          MColors.darkGrey.withOpacity(0.4), // Shadow color
                      spreadRadius:  0, // Spread radius
                      blurRadius: 0.2,
                      offset: const Offset(
                          0, 1) // Blur radius// Offset to bottom-right
                      ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: MSizes.xs,
                vertical: MSizes.xs,
              ),
              child: Padding(
                padding: const EdgeInsets.all(MSizes.nm),
                child: Text(message, style: MFonts.fontCB1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
