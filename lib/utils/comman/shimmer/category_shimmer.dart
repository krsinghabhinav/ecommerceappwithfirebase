import 'package:flutter/material.dart';

import '../../constants/custome_sizes.dart';
import 'shimmer_effect.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (context, index) =>
                const SizedBox(width: CustomeSizes.spaceBtwItems),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              CustomShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: CustomeSizes.spaceBtwItems / 2),

              /// Text
              CustomShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
