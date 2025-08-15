import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceappwithfirebase/controller/banner_controllerd.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/home/widgets/BannerDotIndecator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman/custome_rounded_image.dart';
import '../../../../../controller/home_controller.dart';

class CustomePromoSider extends StatelessWidget {
  CustomePromoSider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final bannerControllerd = Get.put(BannerControllerd());
    return Column(
      children: [
        Obx(() {
          final banlist = bannerControllerd.bannersList;
          if (bannerControllerd.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (banlist.isEmpty) {
            return const Center(child: Text('No Banner Found'));
          }
          return CarouselSlider(
            carouselController: homeController.carouselController,
            items:
                bannerControllerd.bannersList
                    .map(
                      (e) => CustomeRoundedImage(
                        image: e.imageUrl,
                        isNetworkImage: true,
                        onTab: () {
                          Get.toNamed(e.targetScreen);
                        },
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              viewportFraction: 2,
              autoPlay: true,
              onPageChanged: (index, reason) {
                homeController.updateIndex(index);
              },
            ),
          );
        }),
        SizedBox(height: Get.height * 0.02),
        BannerDotIndicator(),
      ],
    );
  }
}
