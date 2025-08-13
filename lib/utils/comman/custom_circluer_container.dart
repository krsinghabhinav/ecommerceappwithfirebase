import 'package:flutter/material.dart';

import '../constants/custom_colorsd.dart';
import '../helpers/custom_device_helper.dart';

class customcirculercontainer extends StatelessWidget {
  const customcirculercontainer({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.child,
  });
  final Widget? child;
  final double? height, width, radius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: CustomDeviceHelper.getScreenHeight(context) * 0.4,
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        // color: CustomeColors.white.withValues(alpha: 0.1),
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: child,
    );
  }
}
