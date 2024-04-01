// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/authentication/screens/signup/email_verification_screen.dart';
// import 'package:motodealz/features/authentication/screens/password_configuration/forgot_password_final.dart';
// import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/network_manager.dart';
import 'package:motodealz/utils/popups/full_screen_loader.dart';
import 'package:motodealz/utils/popups/loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../common/model/user_details.dart';

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
      // // Start Loading
      // MFullScreenLoader.openLoadingDialog(
      //     'We are processing your information...',
      //     MImages.success);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //Remove Loader
      MFullScreenLoader.stopLoading();

      //Show success message
      MLoaders.successSnackBar(
          title: 'Congratulations',
          message:
              'Your account has been created! Verify your email to continue.');

      // Local Storage
      final deviceStorage = GetStorage();
      deviceStorage.write(('IsFirstTime'), false);

      //Move to verify Email Screen
      Get.to(() => EmailVerificationScreen(email: email.text.trim()));
    } catch (e) {
      // Show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
