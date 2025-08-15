import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/reset_email_password_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/personalization/re_authenticate_user_form.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../utils/helpers/validators/validation.dart';
import '../utils/utils.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final RxBool isForget = false.obs;
  var isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> sendForgetPassword() async {
    final String email = emailController.text.trim();

    // Validate email format
    final String? emailError = CustomValidator.validateEmail(email);
    if (emailError != null) {
      Utils.showToast(emailError);
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      CustomSnackBarHelpers.successSnackBar(
        title: "Password Reset Email Sent",
        message: "Check your email to reset your password.",
      );

      isForget.value = true;

      Get.to(() => ResetEmailPasswordScreen(email: email));
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Invalid email format.");
    } catch (e) {
      Utils.showToast("Something went wrong. Please try again.");
      print("Error in sending password reset email: $e");
    }
  }

  Future<void> reSendForgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      CustomSnackBarHelpers.successSnackBar(
        title: "Password Reset Email Sent",
        message: "Check your email to reset your password.",
      );

      isForget.value = true;
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Invalid email format.");
    } catch (e) {
      Utils.showToast("Something went wrong. Please try again.");
      print("Error in sending password reset email: $e");
    }
  }

  Future<bool> reAuthenticateUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final currentUser = auth.currentUser;

    try {
      isLoading.value = true;

      if (currentUser == null) {
        Utils.showToast("No user is currently signed in.");
        return false;
      }

      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await currentUser.reauthenticateWithCredential(credential);
      Utils.showToast(" User re-authenticated successfully.");
      return true; // ✅ Success
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast("Firebase Error: ${e.message}");
    } on PlatformException catch (e) {
      Utils.showToast("Platform Error: ${e.message}");
    } on FormatException {
      Utils.showToast("Invalid email format.");
    } catch (e) {
      Utils.showToast("Something went wrong. Please try again.");
      print("Error in re-authenticating: $e");
    } finally {
      isLoading.value = false; // ✅ Always reset loading state
    }

    return false; // ❌ Failed
  }
}
