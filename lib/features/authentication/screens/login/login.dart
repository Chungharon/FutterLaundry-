import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:laundryhub/common/styles/spacing_styles.dart';
import 'package:laundryhub/common/widgets_login_signup/form_divider.dart';
import 'package:laundryhub/features/authentication/screens/login/widgets/login_form.dart';
import 'package:laundryhub/features/authentication/screens/login/widgets/login_header.dart';
import 'package:laundryhub/common/widgets_login_signup/social_buttons.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              TLoginHeader(dark: dark),

              /// Form
              TLoginForm(),

              /// Divider 
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSection,
              ),

              /// Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
