import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:laundryhub/data/models/user_model.dart';
import 'package:laundryhub/data/repositories/user/user_repository.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

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
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts[1] : '',
          username: username,
          profilePicture: userCredentials.user!.photoURL ?? '', 
          phoneNumber: userCredentials.user?.phoneNumber ?? '',
          createdAt: DateTime.now().toIso8601String(),
        );

        // Save user data
        await UserRepository.instance.saveUserData(user);

      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving user data.',
      );
    }
  }
}
