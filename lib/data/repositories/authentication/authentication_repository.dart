import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/features/authentication/screens/login/login.dart';
import 'package:motodealz/features/authentication/screens/signup/create_acc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motodealz/features/authentication/screens/signup/email_verification_screen.dart';
import 'package:motodealz/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:motodealz/utils/exceptions/format_exceptions.dart';
import 'package:motodealz/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  // Firebase Authentication instance
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // Check if the user is signed in
    checkAuthentication();
  }

  // Function to check user authentication status
  void checkAuthentication() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
            () => EmailVerificationScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const CreateAccountScreen());
    }

    //
    // Listen to authentication state changes
    //
    //   navigateToHome();
    // } else {
    //   // User is signed out
    //   navigateToLogin();
    // }
  }

  // void navigateToLogin() {
  //   // Get.offAll(
  //   //   const SplashScreen(),
  //   //   transition: Transition.fade,
  //   //   duration: const Duration(milliseconds: 500),
  //   //   curve: Curves.easeInOut,
  //   // );
  //
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     // Navigate to login screen after 500 milliseconds (same duration as splash screen)
  //     Get.offAll(() => const CreateAccountScreen());
  //   });
  // }
  //
  // void navigateToHome() {
  //   Get.offAll(
  //     const SplashScreen(),
  //     transition: Transition.fade,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  //
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     // Navigate to home screen after 500 milliseconds (same duration as splash screen)
  //     Get.offAll(() => const ForgotPasswordLastScreen());
  //   });
  // }

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
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
    try {
      return await _auth.createUserWithEmailAndPassword(
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
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  ///[GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [Logout User]
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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
}
