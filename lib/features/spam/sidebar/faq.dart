import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: MSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MBackButton(),
                    Image.asset(
                      darkMode ? MImages.appBarLogoL : MImages.appBarLogoD,
                      width: MHelperFunctions.screenWidth() * 0.31,
                    ),
                    SizedBox(
                      width: MHelperFunctions.screenWidth() * 0.1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("FAQ", style: MFonts.fontAH1),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              _buildFAQItem(
                  question: 'How do I list my car for sale?',
                  answer:
                      'To list your car for sale, simply go to the "Sell" section of the app and follow the instructions to provide details about your car, including its make, model, year, condition, and photos.',
                  darkMode: darkMode),
              _buildFAQItem(
                  question: 'How do I search for cars?',
                  answer:
                      'You can search for cars using the search bar on the homepage. You can filter your search based on various criteria such as make, model, year, price, and location.',
                  darkMode: darkMode),
              _buildFAQItem(
                  question: 'Can I negotiate the price of a car?',
                  answer:
                      'Yes, you can negotiate the price of a car with the seller. Simply contact the seller through the app and discuss the price.',
                  darkMode: darkMode),
              _buildFAQItem(
                  question: 'Is there a warranty on the cars?',
                  answer:
                      'Warranty options may vary depending on the seller and the car. Some sellers may offer warranties or extended warranties for an additional cost. Make sure to inquire about warranty options with the seller.',
                  darkMode: darkMode),
              _buildFAQItem(
                  question: 'How do I contact a seller?',
                  answer:
                      'You can contact a seller by clicking on the "Contact Seller" button on the car listing page. You can then send a message to the seller directly through the app.',
                  darkMode: darkMode),
              _buildFAQItem(
                  question: 'What if I have a problem with my purchase?',
                  answer:
                      'If you encounter any issues with your purchase, you can contact our customer support team for assistance. We are here to help resolve any problems you may encounter.',
                  darkMode: darkMode),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(
      {required String question,
      required String answer,
      required bool darkMode}) {
    return Container(
      decoration: BoxDecoration(
          color: darkMode ? MColors.surfaceDark : MColors.surface,
          borderRadius: BorderRadius.circular(MSizes.cardRadiusMd)),
      padding: const EdgeInsets.all(MSizes.md),
      margin: const EdgeInsets.only(bottom: MSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            answer,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
