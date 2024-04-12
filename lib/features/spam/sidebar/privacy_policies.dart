import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                  Text("PRIVACY POLICIES", style: MFonts.fontAH1),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),
              const Text(
                'Last updated: April 12, 2024',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'This Privacy Policy outlines the policies and procedures regarding the collection, usage, and disclosure of information when you use our service. It also informs you about your privacy rights and how the law safeguards your data.',
              ),
              const SizedBox(height: 16.0),
              _buildSectionTitle('Interpretation and Definitions'),
              const SizedBox(height: 8.0),
              _buildInterpretation(),
              const SizedBox(height: 16.0),
              _buildTypesOfDataCollected(),
              const SizedBox(height: 16.0),
              _buildUseOfPersonalData(),
              const SizedBox(height: 16.0),
              _buildSharingPersonalInformation(),
              const SizedBox(height: 16.0),
              _buildRetentionOfPersonalData(),
              const SizedBox(height: 16.0),
              _buildTransferOfPersonalData(),
              const SizedBox(height: 16.0),
              _buildSecurityOfPersonalData(),
              const SizedBox(height: 16.0),
              _buildChildrensPrivacy(),
              const SizedBox(height: 16.0),
              _buildLinksToOtherWebsites(),
              const SizedBox(height: 16.0),
              _buildChangesToPrivacyPolicy(),
              const SizedBox(height: 16.0),
              _buildContactUs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    );
  }

  Widget _buildInterpretation() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interpretation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Words with initial capitalization have specific meanings defined under certain conditions. These definitions remain consistent whether in singular or plural form.',
        ),
        SizedBox(height: 16.0),
        Text(
          'Definitions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'For the purpose of this Privacy Policy:',
        ),
        SizedBox(height: 8.0),
        Text(
          'Team Account: A unique account created collectively by your team to access our service.',
        ),
        Text(
          'Affiliate: An entity associated with our team through shared control, where "control" refers to ownership of 50% or more of the shares, equity interest, or other voting securities.',
        ),
        Text(
          'Application: Refers to the software program provided by our team.',
        ),
        Text(
          'Team (referred to as "we," "us," or "our" in this agreement): Refers to your team of 4.',
        ),
        Text(
          'Country: Refers to Kerala, India.',
        ),
        Text(
          'Device: Any device capable of accessing our service, such as a computer, cellphone, or tablet.',
        ),
        Text(
          'Personal Data: Information that identifies or relates to an identifiable individual.',
        ),
        Text(
          'Service: Refers to our application.',
        ),
        Text(
          'Service Provider: Any individual or entity processing data on behalf of our team. This may include third-party companies assisting in service provision, data analysis, or other support functions.',
        ),
        Text(
          'Usage Data: Data collected automatically, either generated by the use of our service or from its infrastructure (e.g., page visit duration).',
        ),
        Text(
          'You: The individual accessing or using our service, or the legal entity represented by such an individual.',
        ),
      ],
    );
  }

  Widget _buildTypesOfDataCollected() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Types of Data Collected',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'While using our service, we may request certain personally identifiable information to facilitate contact or identification. This may include, but is not limited to:',
        ),
        Text('- Email address'),
        Text('- First name and last name'),
        Text('- Address, State, Province, ZIP/Postal code, City'),
        SizedBox(height: 8.0),
        Text(
          'Usage Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Automatically collected data during service usage.',
        ),
        SizedBox(height: 16.0),
        Text(
          'Information Collected while Using the Application',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'During application use, we may, with your prior permission, collect:',
        ),
        Text(
            '- Pictures and other information from your device\'s camera and photo library.'),
      ],
    );
  }

  Widget _buildUseOfPersonalData() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Use of Your Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'We may use Personal Data for various purposes, including but not limited to:',
        ),
        Text('- Providing and maintaining our service.'),
        Text('- Managing your Team Account.'),
        Text(
            '- Contacting you for updates or informative communications related to our service.'),
        Text(
            '- Providing news, special offers, and general information about our offerings.'),
        Text('- Managing your requests and inquiries.'),
        Text(
            '- Analysis, identifying trends, and improving our service, products, and marketing.'),
      ],
    );
  }

  Widget _buildSharingPersonalInformation() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sharing Your Personal Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'We may share your personal information in the following circumstances:',
        ),
        Text(
            '- With Service Providers to facilitate service provision and analysis.'),
        Text(
            '- In the context of business transfers, such as mergers, acquisitions, or asset sales.'),
        Text(
            '- With Affiliates, subject to their adherence to this Privacy Policy.'),
        Text(
            '- With business partners to offer products, services, or promotions.'),
        Text(
            '- With other users if you choose to share personal information publicly or interact in public areas.'),
        Text(
            '- We may disclose your personal information for other purposes with your consent.'),
      ],
    );
  }

  Widget _buildRetentionOfPersonalData() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Retention of Your Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'We will retain your Personal Data only as long as necessary for the purposes outlined in this Privacy Policy, and as required to comply with legal obligations.',
        ),
      ],
    );
  }

  Widget _buildTransferOfPersonalData() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transfer of Your Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Your information, including Personal Data, may be processed and stored outside of your country\'s jurisdiction. By providing your information, you consent to such transfers and processing.',
        ),
      ],
    );
  }

  Widget _buildSecurityOfPersonalData() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Security of Your Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'While we employ commercially acceptable measures to protect your Personal Data, we cannot guarantee absolute security.',
        ),
      ],
    );
  }

  Widget _buildChildrensPrivacy() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Children\'s Privacy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Our service is not directed to anyone under the age of 13, and we do not knowingly collect personal information from individuals under 13 years old.',
        ),
      ],
    );
  }

  Widget _buildLinksToOtherWebsites() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Links to Other Websites',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Our service may contain links to third-party websites. We have no control over their content or privacy policies and assume no responsibility for them.',
        ),
      ],
    );
  }

  Widget _buildChangesToPrivacyPolicy() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Changes to this Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'We reserve the right to update our Privacy Policy, with changes being effective upon posting. We will notify you of any significant changes via email or a notice on our service.',
        ),
      ],
    );
  }

  Widget _buildContactUs() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'If you have any questions or concerns regarding this Privacy Policy, please contact us:',
        ),
        SizedBox(height: 8.0),
        Text(
          'By email: cognito.work@gmail.com',
        ),
        Text(
          'By phone number: 8650700872',
        ),
      ],
    );
  }
}
