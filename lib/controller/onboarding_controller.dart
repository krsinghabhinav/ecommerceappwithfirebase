import 'package:ecommerceappwithfirebase/common/localstoragetext.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../features/authentication/auth screen/login/login_screen.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final storage = GetStorage();

  final PageController pageController = PageController();

  void updatePage(index) {
    currentIndex.value = index;
  }

  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentIndex.value == 2) {
      storage.write(Localstoragetext.isFirstTime, false);
      Get.offAll(() => LoginScreen());
      return; // do nothing
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);
  }

  // void skipPage() {
  //   currentIndex.value == 2; // do nothing
  //   pageController.jumpToPage(currentIndex.value);
  // }

  void skipPage() {
    if (currentIndex.value != 2) {
      pageController.jumpToPage(2);
      currentIndex.value = 2;
    }
  }
}
