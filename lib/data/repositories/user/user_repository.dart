import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:laundryhub/data/models/user_model.dart';
import 'package:laundryhub/utils/exceptions/firebase_exception.dart';
import 'package:laundryhub/utils/exceptions/format_exception.dart';
import 'package:laundryhub/utils/exceptions/platform_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


/// Respitory class for user-related operations.
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

  /// Add user-related methods here, e.g., fetching user data, updating profiles, etc.
}
