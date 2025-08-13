import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../loaders/animation_loader.dart';

class CustomFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: CustomHelperFunction.isDarkMode(Get.context!)
              ? CustomeColors.dark
              : CustomeColors.white,
          body: Center(
            child: CustomAnimationLoader(text: text),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
