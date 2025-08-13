import 'package:flutter/material.dart';

import '../constants/custom_colorsd.dart';
import '../constants/custome_sizes.dart';
import '../utils.dart';

class CustomeSectionHeadingText extends StatelessWidget {
  const CustomeSectionHeadingText({
    super.key,
    required this.title,
    this.buttonTitle,
    this.onPressed,
  });
  final String title;
  final String? buttonTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Utils.customText(
          title,
          fontSize: CustomeSizes.mlg,
          fontWeight: FontWeight.bold,
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Utils.customText(
            buttonTitle ?? "",
            fontSize: CustomeSizes.md,
            fontWeight: FontWeight.w600,
            color: CustomeColors.primary,
          ),
        ),
      ],
    );
  }
}
