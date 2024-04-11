import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/features/kyc_verification/controllers/kyc_controller.dart';
import 'package:motodealz/features/kyc_verification/model/kyc_data_model.dart';
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _residentialAddressController =
      TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final  _kycController = Get.put(KYCController());
  
    final user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _residentialAddressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: MSizes.defaultSpace,
              right: MSizes.defaultSpace,
              top: MSizes.nm,
              bottom: MSizes.defaultSpace,
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
                        controller: _firstNameController,
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: MTexts.lastName,
                        hintText: "Enter last name",
                        validator: (value) =>
                            MValidator.validateEmptyText('Last Name', value),
                        controller: _lastNameController,
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputFieldWithIcon(
                        label: "Date of Birth",
                        hintText: "DD/MM/YYYY",
                        suffixIcon: MImages.calenderIcon,
                        validator: (value) =>
                            MValidator.validateDate(value),
                        controller: _dobController,
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: "Residential Address",
                        hintText: "Enter permanent address",
                        validator: (value) => MValidator.validateEmptyText(
                            'Residential Address', value),
                        controller: _residentialAddressController,
                      ),
                      const SizedBox(height: MSizes.xs),
                      InputField(
                        label: "Postal Code",
                        hintText: "Enter postal code",
                        validator: (value) =>
                            MValidator.validateEmptyText('Postal Code', value),
                        controller: _postalCodeController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MSizes.xs),
                LargeButtonNS(
                  onPressed: _isContinueButtonEnabled
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            KYCData kycData = KYCData(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              dateOfBirth: _dobController.text,
                              residentialAddress:
                                  _residentialAddressController.text,
                              postalCode: _postalCodeController.text,
                            );
                            _kycController.uploadKYCData(
                                user!.uid, kycData); // Replace userId with actual user ID
                            MHelperFunctions.navigateToScreen(
                                context,
                                const UserVerificationSelfieScreen());
                          }
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
