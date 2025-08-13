


import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/custom_colorsd.dart';

class CustomShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const CustomShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? CustomeColors.darkerGrey : CustomeColors.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}
