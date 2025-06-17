import 'package:flutter/material.dart';
import 'package:laundryhub/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}