import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/common/widgets/appbar/appbar.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:laundryhub/common/widgets/products/cart/coupon_widgets.dart';
import 'package:laundryhub/common/widgets/success_login/success_screen.dart';
import 'package:laundryhub/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:laundryhub/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:laundryhub/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:laundryhub/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:laundryhub/navigation_menu.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --item in Cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSection),

              /// -- Coupon TextField
              TCoupenCode(),
              SizedBox(height: TSizes.spaceBtwSection),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwSection),


                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),


                    /// Payment Methods
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),


                    /// Address 
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )), 
          child: Text('Checkout \$256.0')
        ),
      ),
    );
  }
}
