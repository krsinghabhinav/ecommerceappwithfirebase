import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colorsd.dart';

class CustomCircularLoader extends StatelessWidget {
  const CustomCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomeSizes.lg),
      decoration: const BoxDecoration(
        color: CustomeColors.primary,
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(color: CustomeColors.white),
    );
  }
}
