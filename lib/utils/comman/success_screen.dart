import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/custom_images_path.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subtitle, imageurl;
  final VoidCallback? onTap;
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageurl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomeSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.01),
                  // Lottie.asset(CustomImages.successfullPayment ?? ""),

                  Image.asset(imageurl),
                  SizedBox(height: Get.height * 0.04),
                  Utils.customText(
                    textAlign: TextAlign.center,
                    // CustomText.textaccountcreate,
                    title,
                    fontWeight: FontWeight.bold,
                    fontSize: CustomeSizes.defaultSpace,
                  ),
                  SizedBox(height: Get.height * 0.01),

                  Utils.customText(
                    textAlign: TextAlign.center,
                    // CustomText.textaccountcreatedesc,
                    subtitle,
                  ),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),

              SizedBox(height: Get.height * 0.02),

              Column(
                children: [
                  Utils.customButton(text: "Continue", onTap: onTap ?? () {}),

                  SizedBox(height: Get.height * 0.02),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
