import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/repositories/authentications_repo.dart';
import '../../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../shopping/screen/personalization/controller/user_controller.dart';

class GoogleAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationsRepoController authenticationsRepoController = Get.put(
    AuthenticationsRepoController(),
  );
  UserController userController = Get.put(UserController());
  var isSignedIn = false.obs;
  Future<UserCredential?> signInWithGoogle() async {
    try {
      isSignedIn.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Utils.showToast("Google sign-in cancelled");
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // ✅ Add null-checks before using tokens
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        Utils.showToast("Google Auth token missing");
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      Utils.showToast("Signed in successfully");
      await userController.saveUserRecored(userCredential);
      authenticationsRepoController.screenRedirect();

      return userCredential;
    } catch (e) {
      print("Google Sign-In Error: $e");
      Utils.showToast("Sign-in failed: ${e.toString()}");
      return null;
    } finally {
      isSignedIn.value = false;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    isSignedIn.value = false;
    Utils.showToast("Signed out successfully");
  }
}
