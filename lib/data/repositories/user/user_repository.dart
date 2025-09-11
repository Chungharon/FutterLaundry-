import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundryhub/data/models/user_model.dart';
import 'package:laundryhub/data/repositories/authentication/authentication_repository.dart';
import 'package:laundryhub/utils/exceptions/firebase_exception.dart';
import 'package:laundryhub/utils/exceptions/format_exception.dart';
import 'package:laundryhub/utils/exceptions/platform_exception.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserData(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  /// Function to fetch user details based on user id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  /// Function to update user details in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection('users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  /// Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  /// Function to remove user record from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  /// Function to upload user image (placeholder for future implementation)
  Future<String> uploadImage(String path, String imageName) async {
    try {

      // This is a placeholder method that should be implemented based on your needs
      
      // Example implementation would be:
      // final ref = FirebaseStorage.instance.ref().child(path).child(imageName);
      // final uploadTask = ref.putFile(File(imagePath));
      // final snapshot = await uploadTask;
      // final downloadUrl = await snapshot.ref.getDownloadURL();
      // return downloadUrl;
      
      throw UnimplementedError('Image upload functionality not yet implemented');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'An unexpected error occurred while uploading image';
    }
  }

  static Future checkInternetConnection() async {}
}