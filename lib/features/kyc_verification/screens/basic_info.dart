import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/kyc_verification/screens/selfie_screen.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/validators/validation.dart';

class UserVerificationInfoScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const UserVerificationInfoScreen({Key? key}) : super(key: key);

  @override
  UserVerificationInfoScreenState createState() =>
      UserVerificationInfoScreenState();
}

class UserVerificationInfoScreenState
    extends State<UserVerificationInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isContinueButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MSizes.defaultSpace,
              vertical: MSizes.nm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [MBackButton()],
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const Text(
                  "KYC VERIFICATION",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                SvgPicture.asset(
                  MImages.progressBar1,
                  colorFilter: MSvgStyle.svgStyle3(darkMode),
                ),
                const SizedBox(height: MSizes.defaultSpace),
                const Text(
                  "Basic Info",
                  style: MFonts.fontBH1,
                ),
                const SizedBox(height: MSizes.nm),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    // Validate the form when it changes
                    _validateForm();
                  },
                  child: Column(
                    children: [
                      InputField(
                        label: MTexts.firstName,
                        hintText: "Enter first name",
                        validator: (value) =>
                            MValidator.validateEmptyText('First Name', value),
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: MTexts.lastName,
                        hintText: "Enter last name",
                        validator: (value) =>
                            MValidator.validateEmptyText('Last Name', value),
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputFieldWithIcon(
                        label: "Date of Birth",
                        hintText: "DD/MM/YYYY",
                        suffixIcon: MImages.calenderIcon,
                        validator: (value) => MValidator.validateDate(value),
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: "Residential Address",
                        hintText: "Enter permanent address",
                        validator: (value) => MValidator.validateEmptyText(
                            'Residential Address', value),
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: "Postal Code",
                        hintText: "Enter postal code",
                        validator: (value) =>
                            MValidator.validateEmptyText('Postal Code', value),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MSizes.xs),
                LargeButtonNS(
                  onPressed: _isContinueButtonEnabled
                      ? () {
                          MHelperFunctions.navigateToScreen(
                              context, const UserVerificationSelfieScreen());
                        }
                      : null,
                  child: const Text("Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isContinueButtonEnabled = true;
      });
    } else {
      setState(() {
        _isContinueButtonEnabled = false;
      });
    }
  }
}
