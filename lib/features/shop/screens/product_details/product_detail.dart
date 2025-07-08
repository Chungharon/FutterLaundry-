import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:laundryhub/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:laundryhub/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:laundryhub/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:laundryhub/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:laundryhub/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TProductImageSlider(),
          ),

          // 2 - Product Details
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  /// - Rating & Share button
                  const TRatingAndShare(),

                  /// - Price, Title, Stock & Brand
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwSection / 1.5),

                  /// - Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSection),

                  /// - Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSection),

                  /// - Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vast. There are more things that can be added but',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () =>
                          Get.to(() => const ProductReviewsScreen()
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSection),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
