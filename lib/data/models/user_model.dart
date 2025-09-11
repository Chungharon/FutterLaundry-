import 'package:laundryhub/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String createdAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.createdAt,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        profilePicture: "",
        dateOfBirth: "",
        gender: "",
        address: "",
        createdAt: "",
      );

  // Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'DateOfBirth': dateOfBirth,
      'Gender': gender,
      'Address': address,
      'CreatedAt': createdAt,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['FirstName'] ?? "",
      lastName: data['LastName'] ?? "",
      username: data['Username'] ?? "",
      email: data['Email'] ?? "",
      phoneNumber: data['PhoneNumber'] ?? "",
      profilePicture: data['ProfilePicture'] ?? "",
      dateOfBirth: data['DateOfBirth'] ?? "",
      gender: data['Gender'] ?? "",
      address: data['Address'] ?? "",
      createdAt: data['CreatedAt'] ?? "",
    );
  }
}