import 'package:flutter/material.dart';
import '../../constants/custome_sizes.dart';
import 'shimmer_effect.dart';

class CustomeBoxesShimmer extends StatelessWidget {
  const CustomeBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Three Products
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CustomeSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CustomeSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
