import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/features/authentication/screens/login.dart';
import 'package:motodealz/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // Check if the user is signed in
    checkAuthentication();
  }

  // Function to check user authentication status
  void checkAuthentication() {
    // Listen to authentication state changes
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is signed in
        navigateToHome();
      } else {
        // User is signed out
        navigateToLogin();
      }
    });
  }

  void navigateToLogin() {
    Get.offAll(() => const LoginScreen());
  }

  void navigateToHome() {
  Get.offAll(const SplashScreen(),
    transition: Transition.fade,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );

  Future.delayed(const Duration(milliseconds: 500), () {
    // Navigate to home screen after 500 milliseconds (same duration as splash screen)
    Get.offAll(() => const NavigationMenu());
  });
}

}
