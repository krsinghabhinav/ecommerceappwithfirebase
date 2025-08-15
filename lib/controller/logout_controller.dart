import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/key/database_key.dart';
import '../data/repositories/authentications_repo.dart';
import '../data/repositories/user_repository.dart';
import '../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../utils/utils.dart';
import '../features/authentication/auth screen/login/login_screen.dart';

class LogoutController extends GetxController {
  var loading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  final UserRepository userRepository = Get.put(UserRepository());
  AuthenticationsRepoController authRepoController = Get.put(
    AuthenticationsRepoController(),
  );
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> logout() async {
    try {
      loading.value = true;
      // Sign out from Firebase
      await auth.signOut();
      // Show logout success message
      Utils.showToast("You have been successfully logged out.");
      // Navigate to login screen and clear the previous navigation stack
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Data format is invalid.");
    } catch (e) {
      Utils.showToast("Unexpected error occurred: ${e.toString()}");
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteAccount() async {
    try {
      loading.value = true;
      final user = authRepoController.currentUser;

      if (user == null) {
        Utils.showToast("No user found. Please log in first.");
        return;
      }

      // Get old image URL from Firestore
      DocumentSnapshot userDoc =
          await firestore
              .collection(DatabaseKey.userCollection)
              .doc(user.uid)
              .get();
      String? oldImageUrl;
      if (userDoc.exists) {
        oldImageUrl = userDoc['profilePicture'];
      }
      await userRepository.removeUserRecord(user.uid);

      if (oldImageUrl != null &&
          oldImageUrl.isNotEmpty &&
          oldImageUrl != 'N/A') {
        try {
          await storage.refFromURL(oldImageUrl!).delete();
          Utils.showToast("✅ Profile image deleted successfully.");
        } catch (e) {
          Utils.showToast("⚠ Could not delete profile image: $e");
        }
      }

      final currentAuthUser = auth.currentUser;

      if (currentAuthUser != null) {
        await currentAuthUser.delete();
        Utils.showToast(" Your account has been successfully deleted.");
      } else {
        Utils.showToast("Unable to delete account. Please reauthenticate.");
      }
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Data format is invalid.");
    } catch (e) {
      Utils.showToast("Unexpected error occurred: $e");
    } finally {
      loading.value = false;
    }
  }
}
