import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/custom_colorsd.dart';
import '../utils.dart';
import 'custom_circluer_container.dart';

class CustomHorizontalCirculerCategoryCart extends StatelessWidget {
  const CustomHorizontalCirculerCategoryCart({
    super.key,
    this.title,
    this.imageUrl,
    this.textColor,
    this.onTap,
    this.backgroundColor,
  });
  final String? title, imageUrl;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                customcirculercontainer(
                  height: Get.height * 0.075,
                  width: Get.height * 0.075,
                  radius: Get.height * 0.075 / 2,
                  backgroundColor: backgroundColor,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Image.asset(
                      imageUrl ?? "",
                      // "assets/icons/categories/sports.png",
                      fit: BoxFit.contain,
                      height: Get.height * 0.04,
                      width: Get.height * 0.04,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Utils.customText(
                  title ?? "",
                  color: textColor ?? CustomeColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
