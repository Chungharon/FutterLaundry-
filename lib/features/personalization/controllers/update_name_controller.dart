import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/data/repositories/user/user_repository.dart';
import 'package:laundryhub/features/personalization/controllers/user_controller.dart';
import 'package:laundryhub/features/personalization/screens/profile/profile.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/popups/full_screen_loader.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

/// Controller to manage user related functionality.

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstname = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when house screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstname.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Updating your name...',
        TImages.docerAnimation,
      );

      // check internet connection
      final isConnected = await UserRepository.checkInternetConnection();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstname.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated.',
      );

      // Move to previous screen
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
