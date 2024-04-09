import 'dart:io';
import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class SelectedImageGallery extends StatefulWidget {
  const SelectedImageGallery({super.key, required this.images, required this.onImageRemoved});
  final List<String> images;
  final Function(int) onImageRemoved; // Callback to notify when an image is removed
  @override
  SelectedImageGalleryState createState() => SelectedImageGalleryState();
}

class SelectedImageGalleryState extends State<SelectedImageGallery> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MHelperFunctions.screenHeight() * 0.35,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: MSizes.nm,
          mainAxisSpacing: MSizes.nm,
        ),
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: FileImage(File(widget.images[index])), // Use FileImage instead of AssetImage
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // Remove the image when the close icon is pressed
                    widget.onImageRemoved(index);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
