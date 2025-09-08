import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundryhub/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected Page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

    if (kDebugMode) {
      print('======================== GET STORAGE  Auth Repo ========================');
      print(storage.read('isFirstTime'));
    }

      storage.write('isFirstTime', false);

      if (kDebugMode) {
      print('======================== GET STORAGE  Auth Repo ========================');
      print(storage.read('isFirstTime'));
    }
    
      Get.offAll(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
