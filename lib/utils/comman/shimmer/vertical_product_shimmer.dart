import 'package:flutter/material.dart';
import '../../constants/custome_sizes.dart';
import '../GridLayout.dart';
import 'shimmer_effect.dart';

class CustomVerticalProductShimmer extends StatelessWidget {
  const CustomVerticalProductShimmer({super.key, this.itemCount = 16});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      itemCount: itemCount,
      itemBuilder:
          (context, index) => const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                CustomShimmerEffect(width: 180, height: 180),
                SizedBox(height: CustomeSizes.spaceBtwItems),

                /// Text
                CustomShimmerEffect(width: 160, height: 15),
                SizedBox(height: CustomeSizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 110, height: 15),
              ],
            ),
          ),
      mainAxisExtent: 0.0,
    );
  }
}
