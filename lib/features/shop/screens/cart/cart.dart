import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laundryhub/common/widgets/appbar/appbar.dart';
import 'package:laundryhub/common/widgets/products/cart/cart_item.dart';
import 'package:laundryhub/features/shop/screens/checkout/checkout.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        /// --item in Cart
        child: TCartItem(),
      ),
      
      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$256.0')),
      ),
    );
  }
}


