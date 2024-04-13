import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                  Text("ABOUT US", style: MFonts.fontAH1),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const Text(
                'Welcome to our car selling app, built with Flutter and powered by Firebase. We aim to improve the car sales experience, focusing on safety, quality, and transparency for our users.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'App Overview:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Our app provides a platform for direct seller-to-buyer transactions, ensuring user security and trust throughout the buying and selling process. Key features include ID verification, document validation, and live photos to enhance transparency and authenticity.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Safety and Security:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'We prioritize user safety by implementing ID verification and document validation for all listings. Our platform promotes private messaging between buyers and sellers for secure communications and enforces limits on listings to maintain quality and trust.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Financial Security:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'For financial security, we integrate trusted payment gateways and an escrow system that safeguards transactions until both parties are satisfied.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Vehicle Inspection and Verification:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Certified mechanics assess vehicle conditions to provide accurate information to buyers. Additionally, our app uses a VIN Decoding API to verify the car\'s history, providing buyers with confidence in their purchase.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'User-Friendly Features:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Our app offers easy profile management tools and a user-friendly interface. It leverages Google Maps for location display, making it easy for buyers to find vehicles near them, and includes a robust search feature for efficient browsing.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Academic Project Scope:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Our app is developed as part of an academic project, showcasing the capabilities of Flutter and Firebase in creating mobile applications. We are committed to continuous improvement and welcome feedback from our users.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Thank you for choosing our app for your car buying and selling needs. We aim to provide you with a safe, transparent, and user-friendly experience.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
