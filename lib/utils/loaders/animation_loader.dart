import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/custom_colorsd.dart';

class CustomAnimationLoader extends StatelessWidget {
  final String text;
  final String? animation;
  final bool showActionButton;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const CustomAnimationLoader({
    super.key,
    required this.text,
    this.animation ,
    this.showActionButton = false,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: Get.height),
          child: IntrinsicHeight(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(CustomeSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Animation
                    Lottie.asset("assets/animation/loading.json", width: Get.width * 0.8),
                    const SizedBox(height: CustomeSizes.defaultSpace),

                    /// Title
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: CustomeSizes.defaultSpace),

                    /// Action Button (optional)
                    if (showActionButton && actionText != null)
                      SizedBox(
                        width: 250,
                        child: OutlinedButton(
                          onPressed: onActionPressed,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: CustomeColors.dark,
                          ),
                          child: Text(
                            actionText!,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(color: CustomeColors.light),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
