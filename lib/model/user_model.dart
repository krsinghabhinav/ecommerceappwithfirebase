import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/testing.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? profilePicture;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  static List<String> nameParts(fullname) => fullname.split("");
  // Optional: Full name getter
  String get fullName => "${firstName ?? ''} ${lastName ?? ''}".trim();
  // Create UserModel from Firestore document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        id: document.id, // use Firestore doc ID if needed
        firstName: data!['firstName'] ?? " ",
        lastName: data['lastName'] ?? "",
        username: data['username'] ?? "",
        email: data['email'] ?? "",
        phoneNumber: data['phoneNumber'] ?? "",
        profilePicture: data['profilePicture'] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }

  /// Convert the model to JSON format for storage (e.g. Firebase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  /// Returns an empty user model
  static UserModel empty() => UserModel(
    id: "",
    firstName: "",
    lastName: "",
    username: "",
    email: "",
    phoneNumber: "",
    profilePicture: "",
  );
}
