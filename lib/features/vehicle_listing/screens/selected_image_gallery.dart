import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SelectedImageGallery extends StatefulWidget {
  const SelectedImageGallery({Key? key}) : super(key: key);

  @override
  SelectedImageGalleryState createState() => SelectedImageGalleryState();
}

class SelectedImageGalleryState extends State<SelectedImageGallery> {
  final List<String> _uploadedImages = [
    MImages.sampleCar1,
    MImages.sampleCar2,
    MImages.sampleCar3,
    MImages.sampleCar4,
    // Add more image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MHelperFunctions.screenHeight() * 0.25,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: MSizes.nm,
          mainAxisSpacing: MSizes.nm,
        ),
        itemCount: _uploadedImages.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(_uploadedImages[index]), // Changed from Image.asset to AssetImage
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
