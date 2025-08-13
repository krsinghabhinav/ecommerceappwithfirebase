import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/reset_email_password_screen.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/helpers/validators/validation.dart';
import '../../../utils/utils.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final RxBool isForget = false.obs;

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
}
