import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/products/cart/add_remove_button.dart';
import 'package:laundryhub/common/widgets/products/cart/cart_item.dart';
import 'package:laundryhub/common/widgets/texts/product_price_text.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
    // The isScrollable parameter is no longer directly used for Column,
    // but we keep it to avoid breaking calls from CheckoutScreen.
    // Its functionality is now implicitly handled by the parent SingleChildScrollView.
    this.isScrollable = false, // Set to false by default as it won't scroll internally
  });

  final bool showAddRemoveButtons;
  final bool isScrollable; // Still defined, but its effect on internal scrolling is removed

  @override
  Widget build(BuildContext context) {
    // Replaced ListView.separated with Column to eliminate ListView-specific layout issues.
    // Since itemCount is 2, we can manually create the two items with a separator.
    return Column(
      children: [
        // First Cart Item
        Column(
          children: [
            const TCartItem(), // Your cart item widget
            const SizedBox(height: TSizes.spaceBtwItems),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 70),
                  const TProductQuantityWithAddRemoveButton(),
                  const TProductPriceText(price: '256'), // Example price
                ],
              ),
          ],
        ),
        // Separator between items (mimicking ListView.separated)
        const SizedBox(height: TSizes.spaceBtwSection),

        // Second Cart Item
        Column(
          children: [
            const TCartItem(), // Your cart item widget
            const SizedBox(height: TSizes.spaceBtwItems),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 70),
                  const TProductQuantityWithAddRemoveButton(),
                  const TProductPriceText(price: '256'), // Example price
                ],
              ),
          ],
        ),
        // If itemCount were dynamic, you'd use a loop here:
        // ...List.generate(itemCount, (index) => Column(...)).expand((element) => [element, const SizedBox(height: TSizes.spaceBtwSection)]).toList()
      ],
    );
  }
}