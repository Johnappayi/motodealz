import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final UserRepository userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      await userRepository.fetchAndCacheCurrentUserDetails();
    } catch (e) {
      print('Error fetching and caching user record: $e');
      user.value = UserModel.empty();
    }
  }

  void updateHasListedAd(bool newValue) {
    user.update((val) {
      val!.hasListedAd = newValue;
    });
  }

  void updateNoOfListedAd(int newValue) {
    user.update((val) {
      val!.noOfListedAd = newValue;
    });
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        final user = UserModel(
            id: userCredentials.user!.uid,
            firstname: nameParts[0],
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      // Handle error
    }
  }
}
