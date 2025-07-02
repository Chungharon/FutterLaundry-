import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/appbar/appbar.dart';
import 'package:laundryhub/common/widgets/images/t_circular_image.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      /// --Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                /// -- Profile Picture
                const TCircularImage(image: TImages.user, width: 80, height: 80),
                TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),

                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(title: 'Profile Info', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),


                /// Modify Profile Info
                const TSectionHeading(title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(onPressed: () { }, title: 'Name', value: 'John Doe'),
                TProfileMenu(onPressed: () { }, title: 'Username', value: 'John_Doe'),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Modifying Personal Info
                const TSectionHeading(title: 'Personal Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(onPressed: () { }, title: 'User 10', value: '45687', icon: Iconsax.copy),
                TProfileMenu(onPressed: () { }, title: 'E-mail', value: 'Johndoe@gmail.com'),
                TProfileMenu(onPressed: () { }, title: 'Phone Number', value: '+2547000000'),
                TProfileMenu(onPressed: () { }, title: 'Gender', value: 'Male'),
                TProfileMenu(onPressed: () { }, title: 'Date of Birth', value: '10 Oct, 1994'),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () {}, 
                    child: const Text('Delete Account', style: TextStyle(color: Colors.red),)
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
