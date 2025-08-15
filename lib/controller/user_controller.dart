import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/login/login_screen.dart';
import 'package:ecommerceappwithfirebase/model/user_model.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/personalization/re_authenticate_user_form.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/repositories/authentications_repo.dart';
import '../data/repositories/user_repository.dart';
import '../utils/helpers/validators/validation.dart';
import 'forgetpassword_controller.dart';
import 'google_auth_controller.dart';
import 'logout_controller.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel.empty().obs;
  var isLoading = false.obs;
  late UserRepository userRepository;
  late LogoutController logoutController;
  late AuthenticationsRepoController authRepoController;
  late GoogleAuthController loginWithGoogle;
  late ForgotPasswordController forgotPasswordController;

  @override
  void onInit() {
    super.onInit();
    authRepoController = Get.find<AuthenticationsRepoController>();
    logoutController = Get.find<LogoutController>();
    userRepository = Get.find<UserRepository>();
    forgotPasswordController = Get.find<ForgotPasswordController>();

    // Delay GoogleAuthController fetch until next event loop
    Future.microtask(() {
      loginWithGoogle = Get.find<GoogleAuthController>();
    });

    fetchUserDetails();
  }

  var isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> saveUserRecored(UserCredential userCredential) async {
    try {
      final displayName = userCredential.user!.displayName ?? "";
      // Split the name into parts
      final nameParts = displayName.trim().split(" ");
      // First name = everything except the last word
      final firstName =
          nameParts.length > 1
              ? nameParts.sublist(0, nameParts.length - 1).join(" ")
              : displayName;
      // Last name = last word (if available)
      final lastName = nameParts.length > 1 ? nameParts.last : "";
      // Full name = original displayName
      final fullName = displayName;

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        username: fullName.toLowerCase(), // lowercase if needed
        email: userCredential.user!.email ?? "",
        profilePicture: userCredential.user!.photoURL ?? "",
        phoneNumber: userCredential.user!.phoneNumber ?? "",
      );

      print("First Name: $firstName");
      print("Last Name: $lastName");
      print("Full Name: $fullName");

      await userRepository.saveUserRecords(userModel);
      print("full=> ${user.value.fullName} ");
    } catch (e) {
      CustomSnackBarHelpers.errorSnackBar(
        title: "Data not saved",
        message: "Something went wrong while saving data",
      );
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      userRepository.fetchUserDetails();
      this.user.value = await userRepository.fetchUserDetails();
    } catch (e) {
      user(UserModel.empty());
      CustomSnackBarHelpers.errorSnackBar(
        title: "Data not saved",
        message: "Something went wrong while saving data",
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(10),
      title: "Detele Account",
      middleText: "Are you sure you want to delete account permanetly",
      content: Column(
        children: [
          Utils.customText(
            "Are you sure you want to delete account permanetly",
            fontSize: 16,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Utils.customOutlinedButton(
                    height: 45,
                    text: "Cancle",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Utils.customButton(
                    backgroundColor: Colors.red,
                    height: 45,
                    text: "Delete",
                    onTap: () {
                      deleteUserAccount();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      isLoading.value = true;
      final currentUser = authRepoController.currentUser;
      if (currentUser == null) {
        Utils.showToast("No user found. Please log in first.");
        isLoading.value = false;
        return;
      }

      final provider = currentUser.providerData.map((e) => e.providerId).first;

      if (provider == 'google.com') {
        await loginWithGoogle.signInWithGoogle();
        await logoutController.deleteAccount();
        Utils.showToast("Account deleted successfully.");
        Get.offAll(() => LoginScreen());
      } else if (provider == 'password') {
        Get.to(() => ReAuthenticateUserForm());
      }
    } catch (e) {
      Utils.showToast("Failed to delete account: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> reAuthenticateUser() async {
    // Validate email format
    if (!emailController.text.contains("@")) {
      Utils.showToast("Email must contain @ symbol.");
      return;
    }

    final emailError = CustomValidator.validateEmail(emailController.text);
    if (emailError != null) {
      Utils.showToast(emailError);
      return;
    }

    // Validate password
    final passwordError = CustomValidator.validatePassword(
      passwordController.text,
    );
    if (passwordError != null) {
      Utils.showToast(passwordError);
      return;
    }

    // Start re-authentication process
    isLoading.value = true;

    try {
      // Reauthenticate with Email & Password
      await forgotPasswordController.reAuthenticateUserWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Delete account after successful re-authentication
      await logoutController.deleteAccount();

      Utils.showToast("Account deleted successfully.");
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Utils.showToast("Failed to re-authenticate: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
