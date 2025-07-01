import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/brands/brand_show_case.dart';
import 'package:laundryhub/common/widgets/layouts/grid_layout.dart';
import 'package:laundryhub/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Brands
              const TBrandShowCase(images: [TImages.productImage3, TImages.productImage2, TImages.productImage1]),
              const TBrandShowCase(images: [TImages.productImage3, TImages.productImage2, TImages.productImage1]),
              const SizedBox(height: TSizes.spaceBtwItems),
      
               /// --- Products
               TSectionHeading(title: 'You might Like', onPressed: () {}),
               const SizedBox(height: TSizes.spaceBtwItems),
      
               TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical()),
               const SizedBox(height: TSizes.spaceBtwItems),
               
            ],
          
          ),
      ),
      ]
      
    );
  }
}