import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/account_create_succefully.dart';
import 'package:ecommerceappwithfirebase/utils/comman/success_screen.dart';
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
import '../../../../controller/logout_controller.dart';
import '../../../../controller/verify_eamil_controller.dart';

class VerityEamilAddress extends StatefulWidget {
  String? email;
  VerityEamilAddress({super.key, this.email});

  @override
  State<VerityEamilAddress> createState() => _VerityEamilAddressState();
}

class _VerityEamilAddressState extends State<VerityEamilAddress> {
  VerifyEmailController verifyEamilController = Get.put(
    VerifyEmailController(),
  );
  late LogoutController logoutController;
  @override
  void initState() {
    logoutController = Get.put(LogoutController());
    super.initState();
  }

  @override
  void dispose() {
    // Properly remove controller from memory
    Get.delete<VerifyEmailController>();
    Get.delete<LogoutController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          actions: [
            IconButton(
              onPressed: () {
                logoutController.logout();
              },
              icon: Icon(Iconsax.close_circle),
            ),
            SizedBox(width: Get.width * 0.02),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomeSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    Lottie.asset(CustomImages.successEmailAnimation ?? ""),
                    SizedBox(height: Get.height * 0.05),
                    Utils.customText(
                      CustomText.textverifyEmail,
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
                      CustomText.textverifyEmaildes,
                    ),
                    SizedBox(height: Get.height * 0.03),
                  ],
                ),

                SizedBox(height: Get.height * 0.02),

                Column(
                  children: [
                    Utils.customButton(
                      text: "Continue",
                      onTap: () {
                        verifyEamilController.checkEmailVerificationStatus();

                        // Get.to(
                        //   () => SuccessScreen(
                        //     imageurl: CustomImages.accountcreated,
                        //     title: CustomText.textaccountcreate,
                        //     subtitle: CustomText.textaccountcreatedesc,
                        //     onTap: () {},
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          verifyEamilController.sendEmailVerification();
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
      ),
    );
  }
}
