import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/common/key/database_key.dart';
import 'package:ecommerceappwithfirebase/features/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../utils/utils.dart';
import 'authentications_repo.dart';

class UserRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  AuthenticationsRepoController authRepoController = Get.put(
    AuthenticationsRepoController(),
  );
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await _db
          .collection(DatabaseKey.userCollection)
          .doc(user.id)
          .set(user.toJson());

      Utils.showToast("User data saved successfully to the database.");
    } on FirebaseAuthException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast(message);
      rethrow;
    } on FirebaseException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast("Firebase Error: $message");
      rethrow;
    } on PlatformException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast("Platform Error: $message");
      rethrow;
    } on FormatException {
      Utils.showToast("Invalid data format.");
      rethrow;
    } catch (e) {
      Utils.showToast("An unexpected error occurred: ${e.toString()}");
      rethrow;
    }
  }

  //read
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = authRepoController.currentUser;
      if (user == null) {
        Utils.showToast("No user logged in.");
        return UserModel.empty();
      }
      final documentSnapshot =
          await _db
              .collection(DatabaseKey.userCollection)
              .doc(authRepoController.currentUser!.uid)
              .get();

      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }
      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast(message);
      rethrow;
    } on FirebaseException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast("Firebase Error: $message");
      rethrow;
    } on PlatformException catch (e) {
      final message = CustomFirebaseAuthException(e.code).message;
      Utils.showToast("Platform Error: $message");
      rethrow;
    } on FormatException {
      Utils.showToast("Invalid data format.");
      rethrow;
    } catch (e) {
      Utils.showToast("An unexpected error occurred: ${e.toString()}");
      rethrow;
    }
  }
}
