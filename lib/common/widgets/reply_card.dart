import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key, required this.message, required this.time});
  final String message;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: darkMode ? MColors.surfaceDark : MColors.card,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(MSizes.cardRadiusSm),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.circular(MSizes.cardRadiusSm), // Sharp bottom-right corner
                  topRight: Radius.circular(MSizes.cardRadiusSm),
                ), // Adjust as needed
                boxShadow: [
                  BoxShadow(
                      color:
                          darkMode ? MColors.darkGrey.withOpacity(0.4) : MColors.lightGrey.withOpacity(0.4), // Shadow color
                      spreadRadius:  0, // Spread radius
                      blurRadius: 0.2,
                      offset: const Offset(
                          0,1) // Blur radius// Offset to bottom-right
                      ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                  horizontal: MSizes.xs, vertical: MSizes.xs),
              child: Padding(
                padding: const EdgeInsets.all(MSizes.nm),
                child: Text(message, style: MFonts.fontCB1),
              ),
            ),
            Text(MHelperFunctions.getFormattedTime(time).toLowerCase(),
                style: MFonts.fontCB2.copyWith(color: MColors.lightGrey)),
          ],
        ),
      ),
    );
  }
}
