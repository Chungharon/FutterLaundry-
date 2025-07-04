import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/chips/choice_chip.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:laundryhub/common/widgets/texts/product_price_text.dart';
import 'package:laundryhub/common/widgets/texts/product_title_text.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// --selected Atribute Pricing & Description
        TRoundedContainer(
          padding:  const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock
              Row(
                children: [
                  TSectionHeading(title: 'variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price :', smallSize: true),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Sale Price
                          const TProductPriceText(price: '20'),

                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock : ', smallSize: true),
                           Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const TProductTitleText(
                title: 'This is the Description of the Product one it can go upto max 4 times.', 
                smallSize: true,
                maxLines: 4,
              ),
              
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),


        /// --Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Yellow', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Red', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Brown', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Black', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Orange', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'LightGreen', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Baige', selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 42', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'EU 44', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 46', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
