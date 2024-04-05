import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Method to update hasListedAd
  void updateHasListedAd(bool newValue) {
    user.update((val) {
      val!.hasListedAd = newValue;
    });
  }

  // Method to update noOfListedAd
  void updateNoOfListedAd(int newValue) {
    user.update((val) {
      val!.noOfListedAd = newValue;
    });
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            username: username,
            firstname: nameParts[0],
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      MLoaders.warningSnackBar(
          title: 'Data not stored.',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}
