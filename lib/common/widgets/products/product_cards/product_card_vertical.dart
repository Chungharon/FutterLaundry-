import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/styles/shadows.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:laundryhub/common/widgets/icons/t_circular_icon.dart';
import 'package:laundryhub/common/widgets/images/t_rounded_images.dart';
import 'package:laundryhub/common/widgets/texts/product_price_title.dart';
import 'package:laundryhub/common/widgets/texts/product_title_text.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
      final dark = THelperFunctions.isDarkMode(context);
    
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- thumbnail image
                  TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
      
                  /// -- Sae tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withAlpha((0.8 * 255).toInt()),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),
      
                  // -- Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,))
                ],
              ),
            ),
      
            const SizedBox(height: TSizes.spaceBtwItems / 2),
      
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(title: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: TSizes.xs),
                      Icon(Iconsax.verify5, color: TColors.primary, size: TSizes.iconXs)
                    ],
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      const TProductPriceTitle(price: '35.0'),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          )
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(child: const Icon(Iconsax.add, color: TColors.white))
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

