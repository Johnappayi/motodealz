import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/success_screen.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/popups/loader.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MLoaders.successSnackBar(
          title: 'Email sent',
          message: "Please Check your inbox and verify your email.");
    } catch (e) {
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image : MImages.emailSent,
            title : "Your Account has been created!",
            subTitle: "Congratulations! Your account has been successfully created.",
            onPressed: () => AuthenticationRepository.instance.initialCheckAuthentication()),
        );
      }
    });
  }

  /// Manually Check if the email is Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(SuccessScreen(
        image : MImages.emailSent,
            title : "Your Account has been created!",
            subTitle: "Congratulations! Your account has been successfully created.",
            onPressed: () => AuthenticationRepository.instance.initialCheckAuthentication()),
      );
    }
  }
}
