import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../controller/home_controller.dart';

class BannerDotIndecator extends StatelessWidget {
  const BannerDotIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(
      () => SmoothPageIndicator(
        controller: PageController(
          initialPage: homeController.selectedIndex.value,
        ),
        count: 6,
        // axisDirection: Axis.vertical,
        effect: ExpandingDotsEffect(dotHeight: 6),
      ),
    );
  }
}
