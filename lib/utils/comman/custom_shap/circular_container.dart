import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';

class CustomeCircularContainer extends StatelessWidget {
  const CustomeCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.backgroundColor = CustomeColors.white,
    this.padding,
    this.margin,
    this.child,
  });

  final double height, width;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
