import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/home/widgets/BannerDotIndecator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman/custome_rounded_image.dart';
import '../../../../../controller/home_controller.dart';

class CustomePromoSider extends StatelessWidget {
  CustomePromoSider({super.key, required this.banner});

  List<String> banner;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          carouselController: homeController.carouselController,
          items: banner.map((e) => CustomeRoundedImage(image: e)).toList(),
          options: CarouselOptions(
            viewportFraction: 2,
            autoPlay: true,
            onPageChanged: (index, reason) {
              homeController.updateIndex(index);
            },
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        BannerDotIndecator(),
      ],
    );
  }
}
