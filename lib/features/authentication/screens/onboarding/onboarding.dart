import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:laundryhub/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:laundryhub/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:laundryhub/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:laundryhub/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [ // <--- Removed the Column here! Each OnBoardingPage is now a direct child.
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button Animated
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}