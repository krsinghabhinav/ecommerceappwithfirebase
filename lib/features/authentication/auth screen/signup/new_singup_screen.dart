import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_images_path.dart';

import '../../../../controller/verify_eamil_controller.dart';
import '../../../../controller/signup_controller.dart';

class NewSingupScreen extends StatefulWidget {
  const NewSingupScreen({super.key});

  @override
  State<NewSingupScreen> createState() => _NewSingupScreenState();
}

class _NewSingupScreenState extends State<NewSingupScreen> {
  late SignupController signupController;

  @override
  void initState() {
    signupController = Get.put(SignupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomeSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 

   


                    Utils.customText(
                      CustomText.textsignupRegister,
                      fontWeight: FontWeight.bold,
                      fontSize: CustomeSizes.defaultSpace,
                    ),

                    SizedBox(height: Get.height * 0.03),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Utils.customTextFormField(
                            label: "First Name",
                            hintText: "First Name",
                            controller: signupController.firstnameController,
                            prefixIcon: Iconsax.user,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: Get.width * .02),

                        Expanded(
                          child: Utils.customTextFormField(
                            label: "Last Name",
                            hintText: "Last Name",
                            controller: signupController.lastnameController,
                            prefixIcon: Iconsax.user,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),

                    Utils.customTextFormField(
                      label: "Email",
                      hintText: "Email",
                      controller: signupController.emailController,
                      prefixIcon: Iconsax.direct_right,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Utils.customTextFormField(
                      keyboardType: TextInputType.number,
                      label: "Phone",
                      hintText: "Phone Number",
                      controller: signupController.phoneNoController,
                      prefixIcon: Iconsax.call,
                      maxlenth: 10,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Obx(
                      () => Utils.customTextFormField(
                        label: "Password",
                        hintText: "Enter your password",
                        controller: signupController.passwordController,
                        prefixIcon: Iconsax.password_check,
                        obscureText: !signupController.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            signupController.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            signupController.isPasswordVisible.value =
                                !signupController.isPasswordVisible.value;
                          },
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    // SizedBox(height: Get.height * 0.01),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: signupController.isPrivacyPolicy.value,
                            onChanged: (value) {
                              signupController.isPrivacyPolicy.value =
                                  !signupController.isPrivacyPolicy.value;
                            },
                          ),
                        ),
                        Utils.customText(
                          "I agree to ",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        Utils.customText(
                          "Privacy Policy ",
                          fontWeight: FontWeight.w600,
                          color: CustomeColors.buttonPrimary,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                        Utils.customText(
                          "and ",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        Utils.customText(
                          "Terms of use",
                          fontWeight: FontWeight.w600,
                          color: CustomeColors.buttonPrimary,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),

                Obx(
                  () => Column(
                    children: [
                      signupController.isloading.value
                          ? Center(child: const CircularProgressIndicator())
                          : Utils.customButton(
                            text: "Create Account",
                            onTap: () {
                              signupController.registerUser();
                            },
                          ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.25,
                      height: Get.height * 0.002,
                      decoration: BoxDecoration(
                        color: CustomeColors.buttonPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Utils.customText(
                      "Or Sign In With",
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                      width: Get.width * 0.25,
                      height: Get.height * 0.002,
                      decoration: BoxDecoration(
                        color: CustomeColors.buttonPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Utils.customIcon(
                        imagePath: CustomImages.google,
                        size: Get.width * 0.12,
                        borderColor: CustomeColors.grey,
                        backgroundColor: CustomeColors.white,
                      ),
                    ),
                    SizedBox(width: Get.width * .02),
                    Utils.customIcon(
                      imagePath: CustomImages.fb,
                      size: Get.width * 0.12,
                      borderColor: CustomeColors.grey,
                      backgroundColor: CustomeColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
