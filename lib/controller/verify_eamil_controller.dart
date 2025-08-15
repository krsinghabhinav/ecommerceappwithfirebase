import 'dart:async';

import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/login/login_screen.dart';
import 'package:ecommerceappwithfirebase/utils/comman/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/repositories/authentications_repo.dart';
import '../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../utils/utils.dart';

class VerifyEmailController extends GetxController {
  RxBool loading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Timer? _timer;
  AuthenticationsRepoController authenticationsRepoController = Get.put(
    AuthenticationsRepoController(),
  );
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerAutoRedirect();
  }

  Future<void> sendEmailVerification() async {
    try {
      loading.value = true;
      await auth.currentUser?.sendEmailVerification();
      Utils.showToast("Verification email sent to your email");
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (_) {
      Utils.showToast("An unexpected error occurred");
    } finally {
      loading.value = false;
    }
  }

  void setTimerAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await auth.currentUser?.reload();
      final user = auth.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.offAll(
          () => SuccessScreen(
            title: "Email Verified!",
            subtitle:
                "Your email has been successfully verified. You can now continue to the app.",
            imageurl:
                "assets/icons/payment_methods/successful_payment_icon.png",
            onTap: () {
              authenticationsRepoController.screenRedirect();
            },
          ),
        );
      }
    });
  }

  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.offAll(
          () => SuccessScreen(
            title: "Email Verified!",
            subtitle:
                "Your email has been successfully verified. You can now continue to the app.",
            imageurl:
                "assets/icons/payment_methods/successful_payment_icon.png",
            onTap: () {
              authenticationsRepoController.screenRedirect();
            },
          ),
        );
      }
    } catch (e) {
      Utils.showToast("An unexpected error occurred");
    }
  }

  // Future<void> logout() async {
  //   try {
  //     loading.value = true;

  //     // Sign out from Firebase
  //     await auth.signOut();

  //     // Show logout success message
  //     Utils.showToast("You have been successfully logged out.");

  //     // Navigate to login screen and clear the previous navigation stack
  //     Get.offAll(() => LoginScreen());
  //   } on FirebaseAuthException catch (e) {
  //     Utils.showToast(CustomFirebaseAuthException(e.code).message);
  //   } on FirebaseException catch (e) {
  //     Utils.showToast("Firebase Error: ${e.message}");
  //   } on PlatformException catch (e) {
  //     Utils.showToast("Platform Error: ${e.message}");
  //   } on FormatException {
  //     Utils.showToast("Data format is invalid.");
  //   } catch (e) {
  //     Utils.showToast("Unexpected error occurred: ${e.toString()}");
  //   } finally {
  //     loading.value = false;
  //   }
  // }

  @override
  void onClose() {
    _timer?.cancel(); // Clean up timer
    super.onClose();
  }
}
