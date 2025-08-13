import 'package:flutter/material.dart';

import '../constants/custome_sizes.dart';

class CustomeRoundedImage extends StatelessWidget {
  final String? image;
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double? borderRadius; // ✅ Make it nullable

  const CustomeRoundedImage({
    super.key,
    required this.image,
    this.applyImageRadius = true,
    this.backgroundcolor,
    this.border,
    this.borderRadius, // ✅ Default removed
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.isNetworkImage = false,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final double resolvedRadius = borderRadius ?? CustomeSizes.md;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(resolvedRadius),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageRadius
                  ? BorderRadius.circular(resolvedRadius)
                  : BorderRadius.zero,
          child: Image(
            image:
                isNetworkImage
                    ? NetworkImage(image ?? " ") as ImageProvider
                    : AssetImage(image ?? ""),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
