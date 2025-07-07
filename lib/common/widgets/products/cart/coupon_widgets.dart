import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:laundryhub/utils/constants/colors.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class TCoupenCode extends StatelessWidget {
  const TCoupenCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          /// TextFile
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? TColors.white.withAlpha(0.5 as int)
                    : TColors.dark.withAlpha(0.5 as int),
                backgroundColor: Colors.grey.withAlpha(0.1 as int),
                side: BorderSide(color: Colors.grey.withAlpha(0.1 as int)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
