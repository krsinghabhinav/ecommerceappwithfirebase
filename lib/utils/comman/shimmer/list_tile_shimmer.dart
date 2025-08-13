import 'package:flutter/material.dart';
import '../../constants/custome_sizes.dart';
import 'shimmer_effect.dart';

class CustomListTileShimmer extends StatelessWidget {
  const CustomListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            CustomShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: CustomeSizes.spaceBtwItems),
            Column(
              children: [
                /// Brand Name
                CustomShimmerEffect(width: 100, height: 15),
                SizedBox(height: CustomeSizes.spaceBtwItems / 2),

                /// Brand products
                CustomShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
