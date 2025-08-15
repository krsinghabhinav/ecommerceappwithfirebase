import 'package:ecommerceappwithfirebase/controller/forgetpassword_controller.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/custom_images_path.dart';
import '../email screen/reset_email_password_screen.dart';
import '../signup/new_singup_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late ForgotPasswordController forgetpasswordController;

  @override
  void initState() {
    forgetpasswordController = Get.put(ForgotPasswordController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ForgotPasswordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomeSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    Lottie.asset(CustomImages.forgotAnimation ?? ""),
                    SizedBox(height: Get.height * 0.05),
                    Utils.customText(
                      CustomText.textforgot,
                      fontWeight: FontWeight.bold,
                      fontSize: CustomeSizes.defaultSpace,
                    ),

                    Utils.customText(
                      textAlign: TextAlign.center,

                      CustomText.textsignindes,
                    ),
                    SizedBox(height: Get.height * 0.03),
                  ],
                ),

                Column(
                  children: [
                    Utils.customTextFormField(
                      label: "Email",
                      hintText: "Email",
                      controller: forgetpasswordController.emailController,
                      prefixIcon: Iconsax.direct_right,
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),

                Column(
                  children: [
                    Utils.customButton(
                      text: "Submit",
                      onTap: () {
                        forgetpasswordController.sendForgetPassword();
                        forgetpasswordController.emailController.clear();
                      },
                    ),
                    SizedBox(height: Get.height * 0.01),
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
