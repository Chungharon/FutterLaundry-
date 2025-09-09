import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:laundryhub/common/widgets/login_signup/form_divider.dart';
import 'package:laundryhub/common/widgets/login_signup/social_buttons.dart';
import 'package:laundryhub/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override

  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              /// Form
              TSignupForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSection),

              /// Social Buttons
              const TSocialButtons(),
              const SizedBox(height: TSizes.spaceBtwInputFields), 
            ],
          ),
        ),
      ),
    );
  }
}


