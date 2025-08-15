import 'package:ecommerceappwithfirebase/controller/user_controller.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/comman/customappbar.dart';

class ReAuthenticateUserForm extends StatefulWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  State<ReAuthenticateUserForm> createState() => _ReAuthenticateUserFormState();
}

class _ReAuthenticateUserFormState extends State<ReAuthenticateUserForm> {
  // final ChangeNameController changeNameController = Get.put(
  //   ChangeNameController(),
  // );

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: const Text("ReAuthenticate User"),
      ),
      body: Stack(
        children: [
          /// Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: Get.height * .02),
                Utils.customText(
                  " ReAuthenticate User",
                  fontSize: 14,
                  color: CustomeColors.darkGrey,
                ),
                SizedBox(height: Get.height * .02),
                Utils.customTextFormField(
                  label: "email",
                  hintText: "eamil",
                  controller: userController.emailController,
                  prefixIcon: Iconsax.user_edit,
                ),
                SizedBox(height: Get.height * .02),
                Obx(
                  () => Utils.customTextFormField(
                    obscureText: !userController.isPasswordVisible.value,
                    label: "Password",
                    hintText: "Password",
                    controller: userController.passwordController,
                    prefixIcon: Iconsax.password_check,
                    suffixIcon: IconButton(
                      onPressed: () {
                        userController.isPasswordVisible.value =
                            !userController.isPasswordVisible.value;
                      },
                      icon: Icon(
                        userController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .02),
                Utils.customButton(
                  text: "Verify",
                  onTap: () {
                    userController.reAuthenticateUser();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
