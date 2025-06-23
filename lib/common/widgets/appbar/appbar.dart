import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: TSizes.md), 
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
         ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
         : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
         title: title,
         actions: actions,
      ),
    );
  }

  @override
  /// TODO: implement preferredSize
  Size get PreferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
