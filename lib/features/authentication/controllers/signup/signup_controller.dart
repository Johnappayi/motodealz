import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:motodealz/features/authentication/screens/password_configuration/forgot_password_final.dart';
import 'package:motodealz/utils/helpers/network_manager.dart';
import 'package:motodealz/utils/popups/full_screen_loader.dart';
import 'package:motodealz/utils/popups/loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../profile/model/userDetails.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          'assets/animations/thumbsup.json');

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) return;

      //Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(),password.text.trim());

      //Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(id: userCredential.user!.uid, username: username.text.trim(), email: email.text.trim(), profilePicture: "");

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //Show success message
      MLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify your email to continue.');
      //Move to verify Email Screen
      Get.to(() => const ForgotPasswordLastScreen());
      //Remove Loader
      MFullScreenLoader.stopLoading();

    } catch (e) {
      // Show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
