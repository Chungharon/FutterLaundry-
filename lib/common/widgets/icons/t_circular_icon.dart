import 'package:flutter/material.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor != null
        ? backgroundColor!
        : THelperFunctions.isDarkMode(context)
        ? TColors.black.withAlpha((0.9 * 255).toInt())
        : TColors.white.withAlpha((0.9 * 255).toInt()),
      borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size,)),
    );
  }
}