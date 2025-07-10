import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/appbar/appbar.dart';
import 'package:laundryhub/common/widgets/brands/brand_card.dart';
import 'package:laundryhub/common/widgets/products/sorttables/sorttable_product.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSection),

              TSortTablesProducts()
            ],
          ),
        ),
      ),
    );
  }
}