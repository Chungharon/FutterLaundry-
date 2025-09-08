import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laundryhub/data/models/user_model.dart';
import 'package:laundryhub/data/repositories/authentication/authentication_repository.dart';
import 'package:laundryhub/utils/constants/image_strings.dart';
import 'package:laundryhub/utils/network/network_manager.dart';
import 'package:laundryhub/utils/popups/full_screen_loader.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup form key
  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) return;

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy validation
      if (!privacyPolicy.value) {
        TLoaders.errorSnackBar(
          title: 'Accept Privacy Policy',
          message: 'You must agree to the terms and conditions to proceed.',
        );
        return;
      }

      // Register user in the Firebase Authentication & save user data in the  Firebase
      final userCredentials = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authenticated user data in the Firestore database
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '', username: '',
      );

      
    } catch (e) {
      // show some General error
      TLoaders.errorSnackBar(
        title: 'Something went wrong',
        message: e.toString(),
      );
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
