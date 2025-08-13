import 'package:ecommerceappwithfirebase/features/authentication/model/user_model.dart';
import 'package:ecommerceappwithfirebase/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../data/repositories/user_repository.dart';

class UserController extends GetxController {
  final UserRepository userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  Future<void> saveUserRecored(UserCredential userCredential) async {
    try {
      final nameParse = UserModel.nameParts(userCredential.user!.displayName);
      final username = "${userCredential.user!.displayName}";

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParse[0],
        lastName: nameParse.length > 1 ? nameParse.sublist(1).join(" ") : "",
        username: username,
        email: userCredential.user!.email ?? "",
        profilePicture: userCredential.user!.photoURL ?? "",
        phoneNumber: userCredential.user!.phoneNumber ?? "",
      );

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

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }
}
