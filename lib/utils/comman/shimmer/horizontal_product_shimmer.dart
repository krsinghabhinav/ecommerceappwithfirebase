import 'package:flutter/material.dart';

import '../../constants/custome_sizes.dart';
import 'shimmer_effect.dart';

class CustomHorizontalProductShimmer extends StatelessWidget {
  const CustomHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: CustomeSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (context, index) => SizedBox(width: CustomeSizes.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder:
            (context, index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Image
                CustomShimmerEffect(width: 120, height: 120),
                SizedBox(width: CustomeSizes.spaceBtwItems),

                /// Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: CustomeSizes.spaceBtwItems),

                        /// Title
                        CustomShimmerEffect(width: 160, height: 15),
                        SizedBox(height: CustomeSizes.spaceBtwItems / 2),

                        /// Brand
                        CustomShimmerEffect(width: 110, height: 15),
                      ],
                    ),

                    Row(
                      children: [
                        CustomShimmerEffect(width: 40, height: 20),
                        SizedBox(width: CustomeSizes.spaceBtwSections),
                        CustomShimmerEffect(width: 40, height: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
