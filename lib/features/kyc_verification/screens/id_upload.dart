import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/select_file.dart';
import 'package:motodealz/features/kyc_verification/screens/final_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UserVerificationUploadScreen extends StatefulWidget {
  const UserVerificationUploadScreen({super.key});

  @override
  State<UserVerificationUploadScreen> createState() =>
      _UserVerificationUploadScreenState();
}

class _UserVerificationUploadScreenState
    extends State<UserVerificationUploadScreen> {
  File? _frontImage;
  File? _backImage;
  bool hasUploaded1 =false;
  bool hasUploaded2 =false;

  Future<void> _getImage(ImageSource source, bool isFront) async {
    final picker = ImagePicker();

    // Use pickImage instead of getImage
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          _frontImage = File(pickedFile.path);
           hasUploaded1 =true;
        } else {
          _backImage = File(pickedFile.path);
          hasUploaded2 =true;
        }
      });
    }
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
              bottom: MSizes.defaultSpace),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [MBackButton()],
              ),
              const Text(
                "KYC VERIFICATION",
                style: MFonts.fontAH1,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              SvgPicture.asset(
                MImages.progressBar3,
                colorFilter: MSvgStyle.svgStyle3(darkMode),
              ),
              const SizedBox(
                height: MSizes.defaultSpace,
              ),
              const Text(
                "Upload ID Card",
                style: MFonts.fontBH1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Front side",
                    style: MFonts.fontCH4,
                  ),
                  const SizedBox(
                    height: MSizes.nm,
                  ),
                  if(hasUploaded1) 
                  SizedBox(
                      width: MHelperFunctions.screenWidth(),
                      height: MHelperFunctions.screenWidth() / 2.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_frontImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else SelectFile(
                    onPressed: () => _getImage(ImageSource.gallery, true),
                  ),
                  const SizedBox(
                    height: MSizes.defaultSpace,
                  ),
                  const Text(
                    "Back side",
                    style: MFonts.fontCH4,
                  ),
                  const SizedBox(
                    height: MSizes.nm,
                  ),
                  if(hasUploaded2) 
                  SizedBox(
                      width: MHelperFunctions.screenWidth(),
                      height: MHelperFunctions.screenWidth() / 2.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_backImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else SelectFile(
                    onPressed: () => _getImage(ImageSource.gallery, false),
                  ),const SizedBox(
                    height: MSizes.sm,
                  ),
                  Text(
                    "Please ensure that the provided images are clear and visible",
                    style: MFonts.fontCB2.copyWith(color: MColors.lightGrey),
                  ),
                  const SizedBox(
                    height: MSizes.defaultSpace,
                  ),
                  LargeButtonNS(
                    child: const Text("Continue"),
                    onPressed: () => MHelperFunctions.navigateToScreen(
                        context,
                        const UserVerificationLastScreen()),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
