import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';
import 'package:laundryhub/utils/validators/validation.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Headings
            Text(
              TTexts.forgetPasswordTitle, 
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              TTexts.forgetPasswordSubTitle, 
              style: Theme.of(context).textTheme.labelMedium
            ),
            const SizedBox(height: TSizes.spaceBtwItems * 2),

            /// Text Field
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email, 
                validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
                        ),
            ),
          const SizedBox(height: TSizes.spaceBtwSection),
            

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(), 
                child: Text(TTexts.submit)
              ),
            ),

          ],
        ),
      ),
    );
  }
}
