import 'package:flutter/material.dart';
import '../../../../../utils/comman/CustomCounterIcon.dart';
import '../../../../../utils/comman/customappbar.dart';
import '../../../../../utils/utils.dart';
import '../../../../../utils/constants/custom_colorsd.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.fontSize,
  });

  final String title;
  final String? subTitle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.customText(
            title,
            color: CustomeColors.white,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.bold,
          ),
          if (subTitle != null)
            Utils.customText(
              subTitle!,
              color: CustomeColors.white,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w500,
            ),
        ],
      ),
      action:  [CustomCounterIcon()],
    );
  }
}
