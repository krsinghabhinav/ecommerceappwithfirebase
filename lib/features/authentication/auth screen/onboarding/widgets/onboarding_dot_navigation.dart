import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/helpers/custom_device_helper.dart';
import '../../../../../controller/onboarding_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.put(OnboardingController());

    return Positioned(
      bottom: CustomDeviceHelper.getBottomNavigationBarHeight() * 5,
      left: CustomDeviceHelper.getScreenWidth(context) / 3,
      right: CustomDeviceHelper.getScreenWidth(context) / 3,
      child: SmoothPageIndicator(
        controller: onboardingController.pageController,
        onDotClicked: (index) {
          onboardingController.dotNavigationClick(index);
        },
        count: 3,
        // axisDirection: Axis.vertical,
        effect: ExpandingDotsEffect(dotHeight: 6),
      ),
    );
  }
}
