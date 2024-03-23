import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          'assets/animations/thumbsup.json');

      //Check Internet Connectivity

      // Form Validation

      //Register user in the Firebase Authentication & Save user data in the Firebase

      //Save authenticated user data in the Firebase Firestore

      //Show success message

      //Move to verify Email Screen
    } catch (e) {
      // Show some generic error to the user
    } finally {
      //Remove Loader
    }

    // }
  }
}
