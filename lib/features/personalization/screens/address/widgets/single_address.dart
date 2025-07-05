import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key, 
    required this.selectedAddress,

  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      padding:  const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      backgroundColor: selectedAddress ? TColors.primary.withAlpha((0.2 * 255) as int) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkGrey : TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? TColors.light : TColors.dark : null),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                const Text('(*123) 416 2890', maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: TSizes.sm / 2),
                const Text('82346 Timmy Coves, South Liana, Maine 83346, USA', softWrap: true),
              ],
            )
        ],
      ),
    );
  }
}
