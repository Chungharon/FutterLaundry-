
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/layouts/grid_layout.dart';
import 'package:laundryhub/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class TSortTablesProducts extends StatelessWidget {
  const TSortTablesProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)), 
          onChanged: (value) { },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity',
          ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(), 
        ),
        const SizedBox(height: TSizes.spaceBtwSection),
        /// Products
        TGridLayout(itemCount: 11, itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}