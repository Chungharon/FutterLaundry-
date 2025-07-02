import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/appbar/appbar.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:laundryhub/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:laundryhub/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/features/personalization/screens/profile/profile.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),)),

                  /// User Profile Card
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSection),
                ],
              ),
            ),
            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///  Account Settings
                  TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTitle(
                    icon: Iconsax.safe_home, 
                    title: 'My Address', 
                    subTitle: 'Let us know where to find you',
                  ),TSettingsMenuTitle(
                    icon: Iconsax.shopping_bag, 
                    title: 'My Cart', 
                    subTitle: 'Add, remove or edit items in you cart',
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.bag_tick, 
                    title: 'My Orders', 
                    subTitle: 'Track your orders',
                    
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.bank, 
                    title: 'Bank Details', 
                    subTitle: 'Withdraw your earnings',
                    
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.discount_shape, 
                    title: 'My Coupons', 
                    subTitle: 'List of your Discounts',
                    
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.notification, 
                    title: 'Notifications', 
                    subTitle: 'Manage your notifications',
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.security_card, 
                    title: 'Account Privacy', 
                    subTitle: 'Manage your account privacy',
                  ),

                  /// --App Settings
                  const SizedBox(height: TSizes.spaceBtwSection),
                  TSectionHeading(title: 'App Settings', showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                    icon: Iconsax.document_upload, 
                    title: 'Load Data', 
                    subTitle: 'Load data from the Cloud Firebase',
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.location, 
                    title: 'GeoLocation', 
                    subTitle: 'Enable GeoLocation',
                    trailing: Switch(value: true, onChanged: (value) {})
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.security_user, 
                    title: 'Safe Mode', 
                    subTitle: 'Enable Safe Mode',
                    trailing: Switch(value: false, onChanged: (value) {})
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.image, 
                    title: 'HD Images', 
                    subTitle: 'Enable HD Images',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button 
                  const SizedBox(height: TSizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {}, 
                      child: const Text('Logout')),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSection * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
