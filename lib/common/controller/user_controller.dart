import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel?> user = Rx<UserModel?>(null); // Changed to nullable UserModel
  final userRepository = Get.put(UserRepository());

  UserModel? get currentUser => user.value;

  @override
  void onInit() {
    super.onInit();
    // Add print statement for initialization
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final fetchedUser = await userRepository.fetchUserDetails();
      user.value = fetchedUser; // Update user details
    } catch (e) {
      user.value =
          UserModel.empty(); // Set user to empty UserModel in case of error
    } finally {
      profileLoading.value = false;
      // Add print statement after fetching
    }
  }

  // Method to update hasListedAd
  void updateHasListedAd(bool newValue) {
    user.update((val) {
      val!.hasListedAd = newValue;
    });
    // Add print statement for updating hasListedAd
  }

  // Method to update noOfListedAd
  void updateNoOfListedAd(int newValue) {
    user.update((val) {
      val!.noOfListedAd = newValue;
    });
    // Add print statement for updating noOfListedAd
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstname: nameParts[0],
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        // Save user data
        await userRepository.saveUserRecord(user);
        // Print saved user data
      }
    } catch (e) {
      // Print error if saving fails
      MLoaders.warningSnackBar(
          title: 'Data not stored.',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}
