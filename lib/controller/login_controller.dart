import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/repositories/authentications_repo.dart';
import '../navigation_menubar.dart';
import '../utils/helpers/exceptions/firebase_auth_exceptions.dart'
    show CustomFirebaseAuthException;
import '../utils/helpers/network_manager.dart';
import '../utils/helpers/validators/validation.dart';
import '../utils/popups/full_screen_loader.dart';
import '../utils/popups/snackbar_helpers.dart';
import '../utils/utils.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool rememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isPrivacyPolicy = false.obs;
  final localStorage = GetStorage();
  AuthenticationsRepoController authenticationsRepoController = Get.put(
    AuthenticationsRepoController(),
  );
  Future<UserCredential?> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim(); // ✅ Corrected here

    // Email validation
    final emailError = CustomValidator.validateEmail(email);
    if (emailError != null) {
      Utils.showToast("Invalid Email: $emailError");
      return null;
    }

    // Password validation
    final passwordError = CustomValidator.validatePassword(password);
    if (passwordError != null) {
      Utils.showToast("Invalid Password: $passwordError");
      return null;
    }

    try {
      isLoading.value = true;
      CustomFullScreenLoader.openLoadingDialog("It is in Processing....");

      final isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.stopLoading();
        
        CustomSnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return null;
      }
      if (rememberMe.value) {
        localStorage.write('remeber_email', email);
        localStorage.write('remember_password', password);
        localStorage.write('rememberme', rememberMe);
      }
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomSnackBarHelpers.successSnackBar(
        title: "Login Successful",
        message: "Welcome back! You are now logged in.",
      );
      CustomFullScreenLoader.stopLoading();
      authenticationsRepoController.screenRedirect();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (e) {
      Utils.showToast("Unexpected error: ${e.toString()}");
    } finally {
      isLoading.value = false;
      CustomFullScreenLoader.stopLoading();
    }
    return null;
  }

  @override
  void onInit() {
    emailController.text = localStorage.read("remeber_email") ?? "";
    passwordController.text = localStorage.read("remember_password") ?? "";
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
