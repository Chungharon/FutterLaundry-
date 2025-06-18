import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:laundryhub/features/authentication/screens/signup.wigets/signup.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child:
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSection
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields
            ),


            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2
            ),

            /// Remember Me & Forget Password
            Row(
              children: [
                /// Remember Me
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                /// Forgot Password
                TextButton(
                  onPressed: (){},
                  child: const Text(TTexts.forgetPassword)
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSection,
            ),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {},
              child: const Text(TTexts.signIn)
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems
            ),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()),
              child: const Text(TTexts.createAccount)
              ),
            ),
          ],
        ),
      ),
    );
  }
}