import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundryhub/data/repositories/authentication/authentication_repository.dart';
import 'package:laundryhub/features/personalization/controllers/user_controller.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/network/network_manager.dart';
import 'package:laundryhub/utils/popups/full_screen_loader.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar(
          'No Internet',
          'Please check your internet connection and try again.',
        );
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Credentials if Remember Me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim(),
          );
      
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect to Home if login is successful
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Google SignIn
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login user with Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User data
      await  UserController.instance.saveUserRecord(userCredentials);

      
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect to Home if login is successful
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}