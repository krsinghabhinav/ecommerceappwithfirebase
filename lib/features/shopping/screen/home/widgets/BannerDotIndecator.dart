import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../controller/banner_controllerd.dart';
import '../../../../../controller/home_controller.dart';

class BannerDotIndicator extends StatelessWidget {
  const BannerDotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerControllerd = Get.put(BannerControllerd());
    final homeController = Get.put(HomeController());

    return Obx(
      () => SmoothPageIndicator(
        controller: PageController(
          initialPage: homeController.selectedIndex.value,
        ),
        count: bannerControllerd.bannersList.length,
        effect: const ExpandingDotsEffect(
          dotHeight: 8.0, // fixed height for dots
          dotWidth: 16.0, // fixed width for dots
          expansionFactor: 3,
          spacing: 6,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey,
        ),
      ),
    );
  }
}
