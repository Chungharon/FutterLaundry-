import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/common/widgets/success_login/success_screen.dart';
import 'package:laundryhub/features/authentication/screens/login/login.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';
import 'package:laundryhub/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()), 
            icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give default equal space on all sides in all screens.
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// Image
              Image(
                image: AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
      
              /// Title & SubTitle
              Text(
                TTexts.confirmEmail, 
                style: Theme.of(context).textTheme.headlineMedium, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'support@gmail.com', 
                style: Theme.of(context).textTheme.labelLarge, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle, 
                style: Theme.of(context).textTheme.labelMedium, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.staticSuccessIllustration, 
                  title: TTexts.yourAccountCreatedTitle, 
                  subTitle: TTexts.changeYourPasswordSubTitle, 
                  onPressed: () => Get.to(() => const LoginScreen()),
                )), 
                child: const Text(TTexts.tContinue)
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, 
                child: const Text(TTexts.resendEmailIn)
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
