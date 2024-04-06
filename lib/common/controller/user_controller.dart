import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:get/get.dart';

final VehicleController _vehicleController = VehicleController();

class UserController extends GetxController {
  static UserController get instance => Get.find();

  UserModel user = UserModel(
      id: "123456",
      username: "navyajohnson",
      email: "navyajohnson@gmail.com",
      profilePicture: MImages.sampleUser1,
      firstname: 'Navya',
      lastname: 'Johnson',
      isPremium: true,
      isVerified: false,
      hasListedAd: true,
      noOfListedAd: _vehicleController.getVehiclesByOwnerId("123456").length,
      vehicles: _vehicleController.getVehiclesByOwnerId("123456"));

      
  // Method to update hasListedAd
  void updateHasListedAd(bool newValue) {
    user.hasListedAd = newValue;
  }

  // Method to update noOfListedAd
  void updateNoOfListedAd(int newValue) {
    user.noOfListedAd = newValue;
  }

  UserModel getUser() {
    return user;
  }
}
 