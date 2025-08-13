import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/custom_colorsd.dart';
import 'CustomProductTitle.dart';

class CustomBrantTitleWithVerifyIcons extends StatelessWidget {
  const CustomBrantTitleWithVerifyIcons({
    super.key,
    required this.title,
    this.icon,
  });
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProductTitle(title: title ?? " ", isSmallSize: true, small: 14),
        SizedBox(width: Get.width * 0.04),
        Icon(icon ?? Icons.verified, size: 15, color: CustomeColors.primary),
      ],
    );
  }
}
