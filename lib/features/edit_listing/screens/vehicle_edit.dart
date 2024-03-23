// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class VehicleEditScreen extends StatelessWidget {
  const VehicleEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    bool isEditing = false;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              MImages.sampleCar1,
              fit: BoxFit.cover,
              width: MHelperFunctions.screenWidth(),
              height: MHelperFunctions.screenHeight() * 0.45,
            ), //Later change this to carousel
            const MyDraggableSheet(
              child: Column(
                children: [
                  //Make changes here
                  // isEditing
                  //     ? const VehicleDetailsEditUI()
                  //     : const VehicleDetailsUI(),
                  SizedBox(
                    height: 90,
                  ) //Dont remove this
                ],
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(MSizes.lg),
                child: MBackButton(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MHelperFunctions.screenWidth(),
                padding: const EdgeInsets.all(MSizes.lg),
                decoration: BoxDecoration(
                    color: darkMode ? MColors.black : MColors.white),
                child: isEditing
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallSecButton(child: Text("Cancel")),
                          SmallButton(child: Text("Save")),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallSecButton(child: Text("Delete")),
                          SmallButton(child: Text("Edit")),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VehicleDetailsEditUI extends StatelessWidget {
  const VehicleDetailsEditUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(MSizes.defaultSpace),
      child: Column(
        children: [
          Row(),
          SizedBox(
            height: MSizes.spaceBtwItems,
          ),
          Form(
            child: Column(
              children: [
                InputField(
                  label: "Brand",
                  hintText: "Enter brand name",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Model",
                  hintText: "Enter the model",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Year",
                  hintText: "Enter the make year",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Color",
                  hintText: "Enter the color",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "KM driven",
                  hintText: "Enter total KMs driven",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "No. of Owners",
                  hintText: "Enter no. of owners",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Ad title",
                  hintText: "Enter an ad title",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Description",
                  hintText: "Describe the details of your vehicle",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "Registeration no.",
                  hintText: "Enter the licence plate number ",
                ),
                SizedBox(
                  height: MSizes.spaceBtwInputFields,
                ),
                InputField(
                  label: "VIN Number",
                  hintText: "Enter the vehicle identification number",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
