import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../../../utils/constants/custome_sizes.dart';
import '../../../../../utils/helpers/custom_device_helper.dart';
import '../../../../../utils/utils.dart';

class onBoardingPage extends StatelessWidget {
  final String? onBoaringImageName;
  final String? onBoaringTitle;
  final String? onBoaringDescription;
  const onBoardingPage({
    super.key,
    this.onBoaringImageName,
    this.onBoaringTitle,
    this.onBoaringDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: CustomeSizes.defaultSpace,
        right: CustomeSizes.defaultSpace,
        top: CustomDeviceHelper.getAppBarHeight(),
      ),
      child: Column(
        children: [
          Lottie.asset(onBoaringImageName ?? ""),
          Utils.customText(
            onBoaringTitle ?? "",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Utils.customText(
            textAlign: TextAlign.center,
            onBoaringDescription ?? "",
            fontWeight: FontWeight.w500,
            // style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
