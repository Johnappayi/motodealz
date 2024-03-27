import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/common/widgets/button_container.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/listed_ad_frame3.dart';
import 'package:motodealz/features/kyc_verification/screens/kyc_landing_screen.dart';
import 'package:motodealz/features/profile/controller/user_controller.dart';
import 'package:motodealz/features/profile/model/user_details.dart';
import 'package:motodealz/features/shop/screens/vehicle_view_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    final UserController userController = UserController();
    late UserModel user = userController.getUser();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(MSizes.lg),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonContainer(
                            onPressed: () {}, child: MImages.settingsIcon)
                      ],
                    ),
                    const Text(
                      "YOUR PROFILE",
                      style: MFonts.fontAH1,
                    ),
                    const SizedBox(
                      height: MSizes.appBarHeight,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius:
                              73, // Adjust the radius according to your preference
                          backgroundImage: AssetImage(user.profilePicture),
                        ),
                        Positioned(
                          bottom:
                              5, // Adjust bottom position according to your preference
                          right:
                              5, // Adjust right position according to your preference
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: darkMode
                                  ? MColors.secondary
                                  : MColors.primary, // Color of the circle
                            ),
                            child: Center(
                                child: SvgPicture.asset(MImages.cameraIcon,
                                    colorFilter:
                                        MSvgStyle.svgStyle4(darkMode))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: MSizes.nm,
                    ),
                    Text(
                      '${user.firstname} ${user.lastname}',
                      style: MFonts.fontBH2,
                    ),
                    const SizedBox(
                      height: MSizes.sm,
                    ),
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
                                color: darkMode
                                    ? MColors.secondary
                                    : MColors.primary),
                          )
                        ],
                      ),
                    ],
                    const SizedBox(
                      height: MSizes.defaultSpace,
                    ),
                    const SizedBox(
                      height: MSizes.defaultSpace,
                    ),
                    if (!user.isVerified) ...[
                      GestureDetector(
                        onTap: () => MHelperFunctions.navigateToScreen(
                                  context, const UserVerificationStartScreen()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkMode
                                  ? MColors.surfaceDark
                                  : MColors.surface),
                          child: Padding(
                            padding: const EdgeInsets.all(MSizes.nm),
                            child: Column(children: [
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: MSizes.xl),
                                child: Text(
                                  "For enhanced security, please complete your KYC verification.",
                                  textAlign: TextAlign.center,
                                  style: MFonts.fontCB2,
                                ),
                              ),
                              const SizedBox(
                                height: MSizes.md,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    MImages.verifyIcon,
                                    colorFilter: MSvgStyle.svgStyle(darkMode),
                                  ),
                                  const SizedBox(
                                    width: MSizes.sm,
                                  ),
                                  const Text(
                                    "Verify now",
                                    style: MFonts.fontCH2,
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                    ],
                    if (user.hasListedAd) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your ads",
                            style: MFonts.fontBH1,
                          ),
                          const SizedBox(
                            height: MSizes.md,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, // Number of columns
                              mainAxisSpacing: MSizes.sm,
                              childAspectRatio: 378 / 155,
                            ),
                            itemCount: user.noOfListedAd,
                            itemBuilder: (context, index) {
                              return ListedAdFrame3(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VehicleVeiwScreen(
                                        vehicle: user.vehicles![index],
                                      ),
                                    ),
                                  );
                                },
                                vehicle: user.vehicles![index],
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MSizes.defaultSpace,
                      ),
                    ],
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Manage Account",
                          style: MFonts.fontBH1,
                        ),
                        const SizedBox(
                          height: MSizes.md,
                        ), // Example Text Widget 1
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkMode
                                  ? MColors.surfaceDark
                                  : MColors.surface),
                          child: Padding(
                            padding: const EdgeInsets.all(MSizes.nm),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(MImages.paymentIcon,
                                            colorFilter:
                                                MSvgStyle.svgStyle(darkMode)),
                                        const SizedBox(
                                            width: MSizes.spaceBtwItems),
                                        const Text(
                                          "Payment details",
                                          style: MFonts.fontCH3,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(MImages.arrowRIcon,
                                        colorFilter:
                                            MSvgStyle.svgStyle(darkMode))
                                  ],
                                ),
                                const SizedBox(
                                  height: MSizes.defaultSpace,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            MImages.changePasswordIcon,
                                            colorFilter:
                                                MSvgStyle.svgStyle(darkMode)),
                                        const SizedBox(
                                            width: MSizes.spaceBtwItems),
                                        const Text(
                                          "Change password",
                                          style: MFonts.fontCH3,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(MImages.arrowRIcon,
                                        colorFilter:
                                            MSvgStyle.svgStyle(darkMode))
                                  ],
                                ),
                                const SizedBox(
                                  height: MSizes.defaultSpace,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(MImages.favouriteIcon,
                                            colorFilter:
                                                MSvgStyle.svgStyle(darkMode)),
                                        const SizedBox(
                                            width: MSizes.spaceBtwItems),
                                        const Text(
                                          "Your favourites",
                                          style: MFonts.fontCH3,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(MImages.arrowRIcon,
                                        colorFilter:
                                            MSvgStyle.svgStyle(darkMode))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: MSizes.defaultSpace,
                        ),
                        LargeButtonNS(
                          onPressed: () {},
                          child: const Text("Logout"),
                        ),
                        const SizedBox(
                          height: MSizes.defaultSpace,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
