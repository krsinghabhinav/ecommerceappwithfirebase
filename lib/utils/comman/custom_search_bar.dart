import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/custom_colorsd.dart';
import '../constants/custome_sizes.dart';
import '../utils.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Get.height * 0.025,
      left: Get.height * 0.03,
      right: Get.height * 0.03,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: Get.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(width: 1, color: CustomeColors.grey),
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: CustomeColors.darkGrey),
            SizedBox(width: CustomeSizes.spaceBtwItems),
            Utils.customText(
              "Search",
              fontSize: 18,
              color: CustomeColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
