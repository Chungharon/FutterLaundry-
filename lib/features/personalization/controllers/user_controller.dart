import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/data/models/user_model.dart';
import 'package:laundryhub/data/repositories/authentication/authentication_repository.dart';
import 'package:laundryhub/data/repositories/user/user_repository.dart';
import 'package:laundryhub/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/constants/sizes.dart';
import 'package:laundryhub/utils/network/network_manager.dart';
import 'package:laundryhub/utils/popups/full_screen_loader.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts = UserModel.nameParts(
          userCredentials.user?.displayName ?? '',
        );
        final username = UserModel.generateUsername(
          userCredentials.user?.displayName ?? '',
        );

        // Map user data to UserModel
        final user = UserModel(
          id: userCredentials.user!.uid,
          email: userCredentials.user!.email ?? '',
          firstName: nameParts.isNotEmpty ? nameParts[0] : '',
          lastName: nameParts.length > 1 ? nameParts[1] : '',
          username: username,
          profilePicture: userCredentials.user!.photoURL ?? '',
          phoneNumber: userCredentials.user?.phoneNumber ?? '',
          createdAt: DateTime.now().toIso8601String(),
          dateOfBirth: '',
          gender: '',
          address: '',
        );

        // Save user data
        await userRepository.saveUserData(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving user data. ${e.toString()}',
      );
    }
  }

  /// Update user record
  Future<void> updateUserRecord(UserModel updatedUser) async {
    try {
      profileLoading.value = true;
      await userRepository.updateUserDetails(updatedUser);
      user(updatedUser);
      TLoaders.successSnackBar(
        title: 'Success',
        message: 'User details updated successfully',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Update Failed',
        message: 'Failed to update user details. ${e.toString()}',
      );
    } finally {
      profileLoading.value = false;
    }
  }

  /// Update single field
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await userRepository.updateSingleField(json);
      // Refresh user data after update
      await fetchUserRecord();
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Update Failed',
        message: 'Failed to update field. ${e.toString()}',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account?',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: const Text('Delete Account'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// First re-authentication user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        } else if (provider == 'facebook.com') {
          await auth.signInWithFacebook();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        } else if (provider == 'apple.com') {
          await auth.signInWithApple();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        } else if (provider == 'twitter.com') {
          await auth.signInWithTwitter();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// --RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      // Remove Loader
      TFullScreenLoader.stopLoading();
      Get.to(() => const ReAuthLoginForm());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
