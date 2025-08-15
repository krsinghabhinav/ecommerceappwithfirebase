import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/verity_eamil_address.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/login/login_screen.dart';
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

import '../../../../../utils/constants/custom_images_path.dart';

class ResetEmailPasswordScreen extends StatefulWidget {
  final String email;
  const ResetEmailPasswordScreen({super.key, required this.email});

  @override
  State<ResetEmailPasswordScreen> createState() =>
      _ResetEmailPasswordScreenState();
}

class _ResetEmailPasswordScreenState extends State<ResetEmailPasswordScreen> {
  late ForgotPasswordController forgotPasswordController;
  @override
  void initState() {
    forgotPasswordController = Get.put(ForgotPasswordController());
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
        appBar: AppBar(
          automaticallyImplyLeading: false,

          actions: [
            IconButton(onPressed: () {}, icon: Icon(Iconsax.close_circle)),
            SizedBox(width: Get.width * 0.02),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomeSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.01),
                  // Lottie.asset(CustomImages.successEmailAnimation ?? ""),
                  Image.asset("assets/images/mail_illustration.png"),
                  SizedBox(height: Get.height * 0.05),
                  Utils.customText(
                    CustomText.textsendEmail,
                    fontWeight: FontWeight.bold,
                    fontSize: CustomeSizes.defaultSpace,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Utils.customText(
                      textAlign: TextAlign.center,
                      "${widget.email ?? " "}",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Utils.customText(
                    textAlign: TextAlign.center,
                    CustomText.textsendEmaildes,
                  ),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),

              SizedBox(height: Get.height * 0.02),

              Column(
                children: [
                  Utils.customButton(
                    text: "Done",
                    onTap: () {
                    Get.offAll(() => LoginScreen());
                    },
                  ),

                  SizedBox(height: Get.height * 0.02),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        forgotPasswordController.reSendForgetPassword(
                          widget.email,
                        );
                      },
                      child: Utils.customText(
                        textAlign: TextAlign.center,
                        "Resend Email",
                        fontWeight: FontWeight.w600,
                        color: CustomeColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
