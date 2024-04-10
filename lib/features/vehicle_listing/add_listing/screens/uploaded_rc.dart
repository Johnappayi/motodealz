import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inapp_flutter_kyc/inapp_flutter_kyc.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class UploadedRCScreen extends StatelessWidget {
  const UploadedRCScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    ExtractedDataFromId? extractedDataFromId;
     Map<String, bool> keyWordData = {
    'Regn. No' : false,
    'Chassis No' : false,
    'Owner Name' : false,
  };
    MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MSizes.defaultSpace,
              vertical: MSizes.defaultSpace,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [MBackButton()],
                ),
                const Text(
                  "UPLOADED RC",
                  style: MFonts.fontAH1,
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
                const Text(
                  "Review the uploaded RC",
                  style: MFonts.fontBH1,
                ),
                const SizedBox(height: MSizes.defaultSpace),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.defaultSpace),
                SizedBox(
                  width: MHelperFunctions.screenWidth(),
                  height: MHelperFunctions.screenWidth() / 1.587,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: MSizes.sm),
                Text(
                  "Please ensure that the provided images are clear and visible",
                  style: MFonts.fontCB2.copyWith(color: MColors.lightGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MSizes.defaultSpace),
                const SizedBox(height: MSizes.spaceBtwSections),
                const SizedBox(height: MSizes.spaceBtwSections),
                LargeButtonNS(
                  child: const Text("Continue"),
                  onPressed: () async {
                    extractedDataFromId =
                        await EkycServices().openImageScanner(keyWordData);
                    if (extractedDataFromId?.extractedText != null) {
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowScannedText(
                                  scannedText:
                                      extractedDataFromId!.extractedText!,
                                  keyNvalue: extractedDataFromId?.keywordNvalue,
                                )),
                      );
                    }
                  },
                  //  () => MHelperFunctions.navigateToScreen(
                  //   context,
                  //   const VehicleListingInfoScreen(),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ShowScannedText extends StatefulWidget {
  String scannedText;
  Map<String, dynamic>? keyNvalue;

  ShowScannedText({super.key, required this.scannedText, this.keyNvalue});

  @override
  State<ShowScannedText> createState() => _ShowScannedTextState();
}
class FormFieldData {
  final String label;
  String value;

  FormFieldData({required this.label, required this.value});
}
class _ShowScannedTextState extends State<ShowScannedText> {
  List<FormFieldData> formFields = [];
  @override
  void initState() {
    super.initState();
    if(widget.keyNvalue != null) {

      widget.keyNvalue?.forEach((key, value) {
        formFields.add(FormFieldData(label: key, value: value.toString()));
      });
    }
    print(widget.keyNvalue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanned Text"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.keyNvalue != null,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: formFields.length,
                itemBuilder: (context, index) {
                  FormFieldData fieldData = formFields[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      initialValue: fieldData.value,
                      decoration: InputDecoration(labelText: fieldData.label),
                      onChanged: (value) {
                        formFields[index].value = value;
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const Text("Full Extracted Text", style: TextStyle(fontSize: 20),),
          const SizedBox(height: 20,),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20.0),
          //   child: Text(widget.scannedText),
          // ),
      
        ],
      ),
    );
  }
}