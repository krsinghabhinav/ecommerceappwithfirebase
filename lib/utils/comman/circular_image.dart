import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import '../constants/custome_sizes.dart';
import 'shimmer_effectd.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = 0,
    this.isNetworkImage = false,
    this.showBorder = false,
    this.borderColor = CustomeColors.primary,
    this.borderWidth = 1.0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunction.isDarkMode(context);
    final double resolvedRadius = padding ?? CustomeSizes.sm;

    return Container(
      width: width,
      height: height ,
      padding: EdgeInsets.all(resolvedRadius),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (dark ? CustomeColors.dark : CustomeColors.light),
        borderRadius: BorderRadius.circular(100),
        border:
            showBorder
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child:
            isNetworkImage
                ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder:
                      (context, url, progress) =>
                          CustomShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: image,
                )
                : Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
