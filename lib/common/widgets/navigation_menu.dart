import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      floatingActionButton: FloatingActionButton(foregroundColor: darkMode ? MColors.primary : MColors.card,backgroundColor: darkMode ? MColors.secondary : MColors.primary,onPressed:() => {},child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations:[
            NavigationDestination(icon: SvgPicture.asset(MImages.homeUnfilledIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)),selectedIcon: SvgPicture.asset(MImages.homeIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)), label: 'Home'),
            NavigationDestination(icon: SvgPicture.asset(MImages.chatUnfilledIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)),selectedIcon: SvgPicture.asset(MImages.chatIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)), label: 'Chat'),
            // const SizedBox(width: 20),
            const NavigationDestination(icon: SizedBox.shrink(), label: 'Sell'),
            NavigationDestination(icon: SvgPicture.asset(MImages.searchUnfilledIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)),selectedIcon: SvgPicture.asset(MImages.searchIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)), label: 'Search'),
            NavigationDestination(icon: SvgPicture.asset(MImages.profileUnfilledIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)),selectedIcon: SvgPicture.asset(MImages.profileIcon,colorFilter: darkMode ? const ColorFilter.mode(MColors.secondary, BlendMode.srcIn) : const ColorFilter.mode(MColors.primary, BlendMode.srcIn)), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]) ,
    );
  }
}

class NavigationController extends GetxController{
 final Rx<int> selectedIndex=0.obs;

 final screen = [Container(color: Colors.amber,),Container(color: Colors.orange,),Container(color: Colors.white,),Container(color: Colors.green,),Container(color: Colors.purple,)];
}
