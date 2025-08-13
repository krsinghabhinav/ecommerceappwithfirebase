import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';

class CustomeCircularIcon extends StatelessWidget {
  CustomeCircularIcon({
    super.key,
    required this.icon,
    this.size,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunction.isDarkMode(context);
    final double resolvedRadius = size ?? CustomeSizes.md;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color:
            (backgroundColor != null)
                ? backgroundColor
                : dark
                ? CustomeColors.dark.withValues(alpha: 0.9)
                : CustomeColors.light.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: resolvedRadius),
        ),
      ),
    );
  }
}
