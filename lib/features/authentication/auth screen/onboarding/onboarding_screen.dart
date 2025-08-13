import 'package:ecommerceappwithfirebase/features/authentication/controller/onboarding_controller.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_images_path.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_device_helper.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_pages.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingController onboardingController = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.updatePage,
            children: [
              onBoardingPage(
                onBoaringImageName: CustomImages.onboarding1Animation,
                onBoaringTitle: CustomText.onBoardingTtitle1,
                onBoaringDescription: CustomText.onBoardingDes1,
              ),
              onBoardingPage(
                onBoaringImageName: CustomImages.onboarding2Animation,
                onBoaringTitle: CustomText.onBoardingTtitle2,
                onBoaringDescription: CustomText.onBoardingDes2,
              ),
              onBoardingPage(
                onBoaringImageName: CustomImages.onboarding3Animation,
                onBoaringTitle: CustomText.onBoardingTtitle3,
                onBoaringDescription: CustomText.onBoardingDes3,
              ),
            ],
          ),

          onBoardingDotNavigation(),

          /// button at bottom
          Positioned(
            bottom: CustomeSizes.spaceBtwSections * 1,
            left: CustomeSizes.spaceBtwItems,
            right: CustomeSizes.spaceBtwItems,
            child: Obx(
              () => Utils.customButton(
                text:
                    onboardingController.currentIndex.value == 2
                        ? "Get Started"
                        : "Next",
                onTap: () {
                  onboardingController.nextPage();
                },
              ),
            ),
          ),

          Obx(
            () => Positioned(
              top: CustomDeviceHelper.getAppBarHeight(),
              right: 0,
              child:
                  onboardingController.currentIndex.value == 2
                      ? const SizedBox.shrink()
                      : TextButton(
                        onPressed: () {
                          onboardingController.skipPage();
                          print("pressed");
                        },
                        child: Utils.customText(
                          "Skip",
                          color: CustomeColors.info,
                        ),
                      ),
            ),
          ),
     ],
      ),
    );
  }
}
