import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/common/widgets/listed_ad_frame3.dart'; // Corrected import statement
import 'package:motodealz/common/widgets/signin_prompt.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/data/repositories/user/user_repository.dart';
import 'package:motodealz/features/kyc_verification/screens/kyc_landing_screen.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

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
                      const CircleAvatar(
                        radius: 73,
                        backgroundImage: AssetImage(MImages.sampleUser1),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {},
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
                    user?.fullName.isNotEmpty ?? false
                        ? user!.fullName
                        : "Anonymous User",
                    style: MFonts.fontBH2,
                  ),
                  const SizedBox(height: MSizes.sm),
                  if (user?.isPremium ?? false) ...[
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
                    const SizedBox(height: MSizes.defaultSpace),
                  ],
                  if (!(user?.isVerified ?? true)) ...[
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
                  if (user?.hasListedAd ?? false) ...[
                    Column(
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
                          itemCount: user!.noOfListedAd,
                          itemBuilder: (context, index) {
                            return;
                            // ListedAdFrame3(
                            //   onPressed: () {
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) => VehicleEditScreen(
                            //     //       vehicle: user.vehicles![index],
                            //     //     ),
                            //     //   ),
                            //     // );
                            //   },
                            //   vehicle: user.vehicles![index],
                            // );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: MSizes.defaultSpace),
                  ],
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
                                  Row(
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
