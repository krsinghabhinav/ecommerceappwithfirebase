import 'package:ecommerceappwithfirebase/controller/user_controller.dart';
import 'package:ecommerceappwithfirebase/navigation_menubar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../data/repositories/user_repository.dart';
import '../utils/helpers/validators/validation.dart';
import '../utils/utils.dart';

class ChangeNameController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  var isLoading = false.obs;

  UserController userController = Get.put(UserController());
  final UserRepository userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() {
    firstNameController.text = userController.user.value.firstName ?? "";
    lastNameController.text = userController.user.value.lastName ?? "";
  }

  Future<void> updateName() async {
    final firstNameError = CustomValidator.validateEmptyText(
      "First name",
      firstNameController.text,
    );
    if (firstNameError != null) {
      Utils.showToast(firstNameError);
      return;
    }

    final lastNameError = CustomValidator.validateEmptyText(
      "Last name",
      lastNameController.text,
    );
    if (lastNameError != null) {
      Utils.showToast(lastNameError);
      return;
    }

    try {
      isLoading.value = true;

      await userRepository.updateUserDetails({
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      });

      Utils.showToast("Name updated successfully");

      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();
      Get.offAll(() => NavigationMenubar());
    } catch (e) {
      debugPrint("Error updating name: $e");
      Utils.showToast("Error updating name");
    } finally {
      isLoading.value = false;
    }
  }
}
