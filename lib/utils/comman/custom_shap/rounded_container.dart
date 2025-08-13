import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:flutter/material.dart';

class CustomeRoundedContainer extends StatelessWidget {
  const CustomeRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 0,
    this.child,
    this.showBorder = false,
    this.borderColor = CustomeColors.borderPrimary,
    this.backgroundColor = CustomeColors.white,
    this.padding,
    this.margin,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    final double resolvedRadius = radius ?? CustomeSizes.cardRadiusLg;

    return Container(
      width: width, // default 0
      height: height, // default 0
      padding: padding, // default 0
      margin: margin, // default 0
      decoration: BoxDecoration(
        color: backgroundColor, // default white
        borderRadius: BorderRadius.circular(
          radius,
        ), // default 16, which is card radius large
        border:
            showBorder /*false*/
                ? Border.all(color: borderColor)
                : null, // white color default
      ),
      child: child,
    );
  }
}
