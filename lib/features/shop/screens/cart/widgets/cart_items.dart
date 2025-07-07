import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/products/cart/add_remove_button.dart';
import 'package:laundryhub/common/widgets/products/cart/cart_item.dart';
import 'package:laundryhub/common/widgets/texts/product_price_text.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, 
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSection),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price
          if (showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  const SizedBox(width: 70),

                  /// Add Remove Buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
