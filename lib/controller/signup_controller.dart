import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/data/repositories/user_repository.dart';
import 'package:ecommerceappwithfirebase/model/user_model.dart';
import 'package:ecommerceappwithfirebase/controller/user_controller.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/network_manager.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/validators/validation.dart';
import 'package:ecommerceappwithfirebase/utils/popups/full_screen_loader.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../common/key/database_key.dart';
import '../data/repositories/authentications_repo.dart';
import '../features/authentication/auth screen/email screen/verity_eamil_address.dart';

class SignupController extends GetxController {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var selectedImagePath = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  var imageUrl = ''.obs;
  var isImageUploading = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isloading = false.obs;
  RxBool isPrivacyPolicy = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository userRepository = Get.put(UserRepository());
  late UserController userController;
  late AuthenticationsRepoController authRepoController;

  @override
  void onInit() {
    userController = Get.find<UserController>();
    authRepoController = Get.find<AuthenticationsRepoController>();
    super.onInit();
  }

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

      // ... rest of the code
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
        profilePicture: imageUrl.value.isNotEmpty ? imageUrl.value : "N/A",
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

  /// 📌 Upload file to Firebase Storage & delete old file if provided
  Future<String?> uploadFileToFirebaseStorage({
    required String filePath,
    required String folder,
    required String extension,
    String? oldFileUrl, // Optional: old file ka URL for deletion
  }) async {
    try {
      // 🔹 Step 1: Delete old file if URL is provided
      if (oldFileUrl != null && oldFileUrl.isNotEmpty && oldFileUrl != "N/A") {
        try {
          await storage.refFromURL(oldFileUrl).delete();
          print("✅ Old file deleted successfully.");
        } catch (e) {
          print("⚠ Could not delete old file: $e");
        }
      }

      // 🔹 Step 2: Upload new file
      var uuid = Uuid();
      String uniqueFileName = "${uuid.v4()}.$extension";
      final path = "$folder/$uniqueFileName";
      final file = File(filePath);
      final ref = storage.ref().child(path);

      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      Utils.showToast("❌ Error uploading file: $e");
      return null;
    }
  }

  /// 📌 Pick image, upload & update Firestore
  Future<void> pickAndUploadImage(ImageSource source) async {
    try {
      isImageUploading.value = true;

      // Pick image from camera/gallery
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage = await picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (pickedImage == null) {
        Utils.showToast("❌ No image selected.");
        return;
      }

      selectedImagePath.value = pickedImage.path;

      // Get current user
      final currentUser = authRepoController.currentUser;
      if (currentUser == null) {
        Utils.showToast("❌ No logged-in user found.");
        return;
      }

      // Get old image URL from Firestore
      DocumentSnapshot userDoc =
          await firestore
              .collection(DatabaseKey.userCollection)
              .doc(currentUser.uid)
              .get();

      String? oldImageUrl;
      if (userDoc.exists) {
        oldImageUrl = userDoc["profilePicture"];
      }

      // Upload new image & delete old one
      String? downloadURL = await uploadFileToFirebaseStorage(
        filePath: pickedImage.path,
        folder: "ecommerce_profile_images",
        extension: pickedImage.path.split('.').last,
        oldFileUrl: oldImageUrl,
      );

      if (downloadURL == null) {
        Utils.showToast("❌ Failed to upload new profile image.");
        return;
      }

      // Update Firestore
      await firestore
          .collection(DatabaseKey.userCollection)
          .doc(currentUser.uid)
          .update({"profilePicture": downloadURL});

      // Update local reactive variable
      imageUrl.value = downloadURL;
      userController.user.update((val) {
        val?.profilePicture = downloadURL;
      });

      Utils.showToast("✅ Profile image updated successfully!");
    } catch (e) {
      Utils.showToast("❌ Error: $e");
    } finally {
      isImageUploading.value = false;
    }
  }

  // /// Upload file to Firebase Storage
  // Future<String?> uploadFileToFirebaseStorage(
  //   String filePath,
  //   String folder,
  //   String extension,
  // ) async {
  //   try {
  //     var uuid = Uuid();
  //     String uniqueFileName = "${uuid.v4()}.$extension";
  //     final path = "$folder/$uniqueFileName";
  //     final file = File(filePath);
  //     final ref = storage.ref().child(path);

  //     await ref.putFile(file);
  //     return await ref.getDownloadURL();
  //   } catch (e) {
  //     Utils.showToast("❌ Error uploading file: $e");
  //     return null;
  //   }
  // }

  /// 📌 Image pick + upload + Firestore update
  // Future<void> pickAndUploadImage(ImageSource source) async {
  //   try {
  //     isImageUploading.value = true;

  //     // Pick image
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? pickedImage = await picker.pickImage(
  //       source: source,
  //       imageQuality: 80,
  //     );

  //     if (pickedImage == null) {
  //       Utils.showToast("❌ No image selected.");
  //       return;
  //     }

  //     selectedImagePath.value = pickedImage.path;

  //     // Upload to Firebase Storage
  //     String fileExt = pickedImage.path.split('.').last;
  //     String fileName = "${const Uuid().v4()}.$fileExt";
  //     String folderPath = "ecommerce_profile_images/$fileName";

  //     final ref = storage.ref().child(folderPath);
  //     await ref.putFile(File(pickedImage.path));

  //     // Get download URL
  //     String downloadURL = await ref.getDownloadURL();

  //     // Save to Firestore
  //     final currentUser = authRepoController.currentUser;
  //     if (currentUser != null) {
  //       await firestore
  //           .collection(DatabaseKey.userCollection)
  //           .doc(currentUser.uid)
  //           .update({"profilePicture": downloadURL});

  //       imageUrl.value = downloadURL;

  //       // Update local user controller
  //       userController.user.update((val) {
  //         val?.profilePicture = downloadURL;
  //       });

  //       Utils.showToast("✅ Profile image updated successfully!");
  //     } else {
  //       Utils.showToast("❌ No logged-in user found.");
  //     }
  //   } catch (e) {
  //     Utils.showToast("❌ Error: $e");
  //   } finally {
  //     isImageUploading.value = false;
  //   }
  // }

  /// 📌 Bottom Sheet for Image Picker
   showImagePickerSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Pick from Gallery'),
              onTap: () {
                Get.back();
                pickAndUploadImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Pick from Camera'),
              onTap: () {
                Get.back();
                pickAndUploadImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
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
