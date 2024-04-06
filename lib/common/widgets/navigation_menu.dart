import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/svg_styles.dart';
import 'package:motodealz/features/chat/screens/inbox_screen.dart';
import 'package:motodealz/features/profile/screen/profile.dart';
import 'package:motodealz/features/search/screens/search_screen.dart';
import 'package:motodealz/features/shop/screens/homepage.dart';
import 'package:motodealz/features/vehicle_listing/add_listing/screens/rc_capture.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          foregroundColor: darkMode ? MColors.primary : MColors.card,
          backgroundColor: darkMode ? MColors.secondary : MColors.primary,
          onPressed: () => MHelperFunctions.navigateToScreen(
              context,  const VehicleVerificationIdCaptureScreen()),
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(MImages.homeUnfilledIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                selectedIcon: SvgPicture.asset(MImages.homeIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                label: 'Home'),
            NavigationDestination(
                icon: SvgPicture.asset(MImages.chatUnfilledIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                selectedIcon: SvgPicture.asset(MImages.chatIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                label: 'Chat'),
            // const SizedBox(width: 20),
            const NavigationDestination(
                icon: SizedBox.shrink(), label: 'Sell', enabled: false),
            NavigationDestination(
                icon: SvgPicture.asset(MImages.searchUnfilledIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                selectedIcon: SvgPicture.asset(MImages.searchIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                label: 'Search'),
            NavigationDestination(
                icon: SvgPicture.asset(MImages.profileUnfilledIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                selectedIcon: SvgPicture.asset(MImages.profileIcon,
                    colorFilter: MSvgStyle.svgStyle3(darkMode)),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    const InboxScreen(),
    const SizedBox(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
}
