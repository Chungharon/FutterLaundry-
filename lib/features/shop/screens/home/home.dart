import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:laundryhub/common/widgets/texts/section_heading.dart';
import 'package:laundryhub/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:laundryhub/features/shop/screens/home/widgets/home_categories.dart';
import 'package:laundryhub/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --Appbar -- Tutorial [Section = 3, video = 3]
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSection),

                  /// -- Searbar -- Tutorial [Section = 3, Video = 4]
                  TSearchContainer(text: 'Search Services'),
                  SizedBox(height: TSizes.spaceBtwSection),

                  /// -- Categories -- Tutorial [Section = 3, video = 4]
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Services',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories as services to be displayed - Attach Backend for local storage categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// banners
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
            ),
          ],
        ),
      ),
    );
  }
}

