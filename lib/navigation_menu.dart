import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/features/personalization/screens/settings/settings.dart';
import 'package:laundryhub/features/shop/screens/home/home.dart';
import 'package:laundryhub/features/shop/screens/store/store.dart';
import 'package:laundryhub/features/shop/screens/wishlist/wishlist.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
              backgroundColor: darkMode ? TColors.black : Colors.white,
              indicatorColor: darkMode ? TColors.white.withAlpha((0.1 * 255).toInt()) : TColors.black.withAlpha((0.1 * 255).toInt()),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Services'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: controller.screens[controller.selectedIndex.value],
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}