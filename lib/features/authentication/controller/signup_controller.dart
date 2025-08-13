import 'package:ecommerceappwithfirebase/data/repositories/user_repository.dart';
import 'package:ecommerceappwithfirebase/features/authentication/model/user_model.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/network_manager.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/validators/validation.dart';
import 'package:ecommerceappwithfirebase/utils/popups/full_screen_loader.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../auth screen/email screen/verity_eamil_address.dart';

class SignupController extends GetxController {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isloading = false.obs;
  RxBool isPrivacyPolicy = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository userRepository = Get.put(UserRepository());

  Future<UserCredential?> registerUser() async {
    final firstname = firstnameController.text.trim();
    final lastname = lastnameController.text.trim();
    final email = emailController.text.trim();
    final phoneNo = phoneNoController.text.trim();
    final password = passwordController.text.trim();

    // First name validation
    final firstNameError = CustomValidator.validateEmptyText(
      "First name",
      firstname,
    );
    if (firstNameError != null) {
      Utils.showToast(firstNameError);
      return null;
    }

    // Last name validation
    final lastNameError = CustomValidator.validateEmptyText(
      "Last name",
      lastname,
    );
    if (lastNameError != null) {
      Utils.showToast(lastNameError);
      return null;
    }

    // Email validation
    if (!email.contains("@")) {
      Utils.showToast("Email must contain @ symbol.");
      return null;
    }
    final emailError = CustomValidator.validateEmail(email);
    if (emailError != null) {
      Utils.showToast(emailError);
      return null;
    }

    // Phone validation
    final phoneError = CustomValidator.validatePhoneNumber(phoneNo);
    if (phoneError != null) {
      Utils.showToast(phoneError);
      return null;
    }

    // Password validation
    final passwordError = CustomValidator.validatePassword(password);
    if (passwordError != null) {
      Utils.showToast(passwordError);
      return null;
    }

    try {
      isloading.value = true;
      CustomFullScreenLoader.openLoadingDialog("It is in Processing....");

      final isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.stopLoading();
        CustomSnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return null;
      }

      if (!isPrivacyPolicy.value) {
        CustomFullScreenLoader.stopLoading();
        CustomSnackBarHelpers.warningSnackBar(title: "Accept privacy policy");
        return null;
      }

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //create userS
      final userModel = UserModel(
        id: credential.user!.uid,
        firstName: firstname,
        lastName: lastname,
        email: email,
        phoneNumber: phoneNo,
        username: firstname + lastname,
        profilePicture: credential.user!.photoURL,
      );
      // save user
      await userRepository.saveUserRecords(userModel);

      CustomSnackBarHelpers.successSnackBar(
        title: "Congratulations",
        message:
            "Your account has been created. A verification email has been sent.",
      );

      CustomFullScreenLoader.stopLoading();
      Get.to(() => VerityEamilAddress(email: email));

      return credential;
    } on FirebaseAuthException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (e) {
      Utils.showToast("Something went wrong. Please try again.");
    } finally {
      isloading.value = false;
      CustomFullScreenLoader.stopLoading();
    }
    return null;
  }

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
