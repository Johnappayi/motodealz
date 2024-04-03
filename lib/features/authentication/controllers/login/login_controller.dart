import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/features/profile/controller/user_controller.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/network_manager.dart';
import 'package:motodealz/utils/popups/full_screen_loader.dart';
import 'package:motodealz/utils/popups/loader.dart';

class LoginController extends GetxController {
  //Variables
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog('Logging you in...', MImages.success);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email and Password Authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      MFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.checkAuthentication();
    } catch (e) {
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog('Logging you in...', MImages.success);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      MFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.checkAuthentication();
      
    } catch (e) {
      // Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
