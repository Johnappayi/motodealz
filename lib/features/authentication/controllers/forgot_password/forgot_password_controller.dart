import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/features/authentication/screens/password_configuration/forgot_password_final.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/network_manager.dart';
import 'package:motodealz/utils/popups/full_screen_loader.dart';
import 'package:motodealz/utils/popups/loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send Reset Password Email

  sendPasswordResetEmail() async {
    try {
      //Start Loading
      MFullScreenLoader.openLoadingDialog(
          'Processing your request.....', MImages.processing);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Show Success Screen
      MLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Email link has been sent to reset your password');

      //Redirect
      Get.to(() => ForgotPasswordLastScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start Loading
      MFullScreenLoader.openLoadingDialog(
          'Processing your request.....', MImages.processing);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Show Success Screen
      MLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Email link has been sent to reset your password');

    } catch (e) {
      // Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
