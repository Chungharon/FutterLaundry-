import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/image_text_widgets/vertical_images_text.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: TImages.shoeIcon, title: 'Shoes', onTap: () {},);
        },
      ),
    );
  }
}

