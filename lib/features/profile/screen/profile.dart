// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/controller/vehicle_controller.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/common/widgets/listed_ad_frame3.dart';
import 'package:motodealz/common/widgets/signin_prompt.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/kyc_verification/screens/kyc_landing_screen.dart';
import 'package:motodealz/features/profile/screen/change_password.dart';
import 'package:motodealz/features/vehicle_listing/edit_listing/screens/vehicle_edit.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';
import 'package:motodealz/utils/popups/loader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key}); // Corrected constructor syntax

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationRepository());
    final userRepository = Get.put(UserRepository());
    final isUserAuthenticated = authController.isUserAuthenticated();

    if (isUserAuthenticated) {
      return FutureBuilder<UserModel>(
        future: userRepository.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomIndicator(); // Show loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show error message if fetching data fails
          } else {
            return _buildAuthenticatedProfile(snapshot.data,
                context); // Pass fetched user data to the profile widget
          }
        },
      );
    } else {
      return const SignUpPromptScreen();
    }
  }

  Widget _buildAuthenticatedProfile(UserModel? user, BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    final vehicleController = Get.put(VehicleController());
    // Function to fetch vehicles by owner ID
    Future<List<Vehicle>> fetchVehicles(String ownerId) async {
      try {
        return await vehicleController.fetchVehiclesByOwner(ownerId);
      } catch (e) {
        throw Exception("Error fetching vehicles: $e");
      }
    }

    Future<String> convertProfilePictureUrl() async {
      final profilePictureUrl = user!.profilePicture; // Get the Future<String>
      final httpsUrl = await MHttpHelper.convertGCSUrlToHttps(
          profilePictureUrl); // Await the Future
      // Use httpsUrl here (e.g., display in an image widget)
      return httpsUrl; // Optionally return the httpsUrl for further use
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.lg),
          child: Column(
            children: [
              const SizedBox(height: MSizes.appBarHeight),
              const Text(
                "YOUR PROFILE",
                style: MFonts.fontAH1,
              ),
              const SizedBox(
                height: MSizes.appBarHeight,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      FutureBuilder<String>(
                        future:
                            convertProfilePictureUrl(), // Get the Future<String>
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator(); // Show loading indicator
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Text(
                                    'Error: ${snapshot.error}'); // Handle error
                              } else {
                                final httpsUrl = snapshot.data!;
                                return CircleAvatar(
                                  radius: 73,
                                  backgroundImage: NetworkImage(httpsUrl),
                                );
                              }
                            default:
                              return const CircleAvatar(
                                radius: 73,
                                backgroundImage:
                                    AssetImage(MImages.sampleUser1),
                              ); // Handle unexpected states (optional)
                          }
                        },
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              final userRepository = Get.put(UserRepository());
                              await userRepository
                                  .uploadImageAndUpdateProfile();
                              // Show a success message or update UI to display the new profile picture
                              MLoaders.successSnackBar(
                                  title: 'Looking good!',
                                  message:
                                      'Your profile picture has been successfully uploaded');
                            } catch (e) {
                              // Handle error if image upload or profile update fails
                              MLoaders.errorSnackBar(
                                  title: 'Oh snap',
                                  message:
                                      'Failed to update profile picture: $e');
                            }
                          },
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: darkMode
                                  ? MColors.secondary
                                  : MColors.primary,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                MImages.cameraIcon,
                                colorFilter: MSvgStyle.svgStyle4(darkMode),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: MSizes.nm),
                  Text(
                    user!.fullName,
                    style: MFonts.fontBH2,
                  ),
                  const SizedBox(height: MSizes.sm),
                  if (user.isPremium) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          MImages.starIcon,
                          colorFilter: MSvgStyle.svgStyle2(darkMode),
                        ),
                        const SizedBox(width: MSizes.sm),
                        Text(
                          "Premium user",
                          style: MFonts.fontCB3.copyWith(
                            color:
                                darkMode ? MColors.secondary : MColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (!(user.isVerified)) ...[
                    const SizedBox(height: MSizes.defaultSpace),
                    GestureDetector(
                      onTap: () => MHelperFunctions.navigateToScreen(
                        context,
                        const UserVerificationStartScreen(),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              darkMode ? MColors.surfaceDark : MColors.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(MSizes.nm),
                          child: Column(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: MSizes.xl),
                                child: Text(
                                  "For enhanced security, please complete your KYC verification.",
                                  textAlign: TextAlign.center,
                                  style: MFonts.fontCB2,
                                ),
                              ),
                              const SizedBox(height: MSizes.md),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    MImages.verifyIcon,
                                    colorFilter: MSvgStyle.svgStyle(darkMode),
                                  ),
                                  const SizedBox(width: MSizes.sm),
                                  const Text(
                                    "Verify now",
                                    style: MFonts.fontCH2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: MSizes.defaultSpace),
                  ],
                  // Retrieve vehicles and build ListedAdFrame3 widgets
                  FutureBuilder<List<Vehicle>>(
                    future: fetchVehicles(user.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomIndicator(); // Show loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text(
                            'Error: ${snapshot.error}'); // Show error message if fetching data fails
                      } else {
                        final vehicles = snapshot.data ?? [];
                        if (vehicles.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your ads",
                                style: MFonts.fontBH1,
                              ),
                              const SizedBox(height: MSizes.md),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: MSizes.sm,
                                  childAspectRatio: 378 / 155,
                                ),
                                itemCount: vehicles.length,
                                itemBuilder: (context, index) {
                                  return ListedAdFrame3(
                                    onPressed: () {
                                      MHelperFunctions.navigateToScreen(
                                          context,
                                          VehicleEditScreen(
                                            vehicle: vehicles[index],
                                          ));
                                    },
                                    vehicle: vehicles[index],
                                  );
                                },
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox(); // Return an empty widget if no vehicles found
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: MSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Manage Account",
                        style: MFonts.fontBH1,
                      ),
                      const SizedBox(height: MSizes.md),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              darkMode ? MColors.surfaceDark : MColors.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(MSizes.nm),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        MImages.paymentIcon,
                                        colorFilter:
                                            MSvgStyle.svgStyle(darkMode),
                                      ),
                                      const SizedBox(
                                          width: MSizes.spaceBtwItems),
                                      const Text(
                                        "Payment details",
                                        style: MFonts.fontCH3,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    MImages.arrowRIcon,
                                    colorFilter: MSvgStyle.svgStyle(darkMode),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MSizes.defaultSpace),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final authController = Get.find<
                                          AuthenticationRepository>(); // Get the authController instance
                                      authController.sendPasswordResetEmail(user
                                          .email); // Call the sendPasswordResetEmail method
                                      // Navigate to ChangePassword screen and pass the user's email
                                      Get.to(() =>
                                          ChangePassword(email: user.email));
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          MImages.changePasswordIcon,
                                          colorFilter:
                                              MSvgStyle.svgStyle(darkMode),
                                        ),
                                        const SizedBox(
                                            width: MSizes.spaceBtwItems),
                                        const Text(
                                          "Change password",
                                          style: MFonts.fontCH3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    MImages.arrowRIcon,
                                    colorFilter: MSvgStyle.svgStyle(darkMode),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MSizes.defaultSpace),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        MImages.favouriteIcon,
                                        colorFilter:
                                            MSvgStyle.svgStyle(darkMode),
                                      ),
                                      const SizedBox(
                                          width: MSizes.spaceBtwItems),
                                      const Text(
                                        "Your favourites",
                                        style: MFonts.fontCH3,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    MImages.arrowRIcon,
                                    colorFilter: MSvgStyle.svgStyle(darkMode),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: MSizes.defaultSpace),
                      LargeButtonNS(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text("Logout"),
                      ),
                      const SizedBox(height: MSizes.defaultSpace),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
