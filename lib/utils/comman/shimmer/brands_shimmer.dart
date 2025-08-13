import 'package:flutter/material.dart';

import '../../constants/custome_sizes.dart';
import 'shimmer_effect.dart';

class CustomBrandsShimmer extends StatelessWidget {
  const CustomBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder:
          (context, index) => SizedBox(width: CustomeSizes.spaceBtwItems),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder:
          (context, index) => CustomShimmerEffect(
            width: CustomeSizes.brandCardWidth,
            height: CustomeSizes.brandCardHeight,
          ),
    );
  }
}
