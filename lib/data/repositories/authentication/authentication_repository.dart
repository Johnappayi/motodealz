import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
// import 'package:motodealz/features/authentication/screens/login/login.dart';
import 'package:motodealz/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motodealz/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:motodealz/utils/exceptions/format_exceptions.dart';
import 'package:motodealz/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Firebase Authentication instance
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // Check if the user is signed in
    checkAuthentication();
  }

  // Function to check user authentication status
  void checkAuthentication() {
    final user = _auth.currentUser;
    // Listen to authentication state changes
    if (user != null) {
      // User is signed in
      navigateToHome();
    } else {
      // User is signed out
      navigateToLogin();
    }
  }
}

void navigateToLogin() {
  
  // Get.offAll(
  //   const SplashScreen(),
  //   transition: Transition.fade,
  //   duration: const Duration(milliseconds: 500),
  //   curve: Curves.easeInOut,
  // );

  Future.delayed(const Duration(milliseconds: 500), () {
    // Navigate to login screen after 500 milliseconds (same duration as splash screen)
    Get.offAll(() => const NavigationMenu());
  });
}

void navigateToHome() {
  Get.offAll(
    const SplashScreen(),
    transition: Transition.fade,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );

  Future.delayed(const Duration(milliseconds: 500), () {
    // Navigate to home screen after 500 milliseconds (same duration as splash screen)
    Get.offAll(() => const NavigationMenu());
  });
}

/// [EmailAuthentication] - LOGIN
Future<UserCredential> loginWithEmailAndPassword(
    String email, String password) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FormatException catch (_) {
    throw const MFormatException();
  } on PlatformException catch (e) {
    throw MPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

/// [EmailAuthentication] - REGISTER
Future<UserCredential> registerWithEmailAndPassword(
    String email, String password) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FormatException catch (_) {
    throw const MFormatException();
  } on PlatformException catch (e) {
    throw MPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

/// [EmailVerification] - MAIL VERIFICATION
Future <void> sendEmailVerification() async{
    final FirebaseAuth auth = FirebaseAuth.instance;

  try{
    await auth.currentUser?.sendEmailVerification();
  }on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FormatException catch (_) {
    throw const MFormatException();
  } on PlatformException catch (e) {
    throw MPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

