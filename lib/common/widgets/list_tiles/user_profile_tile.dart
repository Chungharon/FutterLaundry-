import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/common/widgets/images/t_circular_image.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  // 1. Declare the onPressed as a final field
  final VoidCallback? onPressed; 

  const TUserProfileTile({
    super.key,
    this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage( 
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('John Doe', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text('John@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(
        onPressed: onPressed, 
        icon: const Icon(Iconsax.edit, color: TColors.white,),
      ),
    );
  }
}