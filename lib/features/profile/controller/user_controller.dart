import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final username = userCredentials.user!.displayName ?? '';

        //Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            username: username,
            email: userCredentials.user!.email ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');
      }
    } catch (e) {
      MLoaders.warningSnackBar(
          title: 'Data not stored.',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}
