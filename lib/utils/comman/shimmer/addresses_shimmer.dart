import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:flutter/material.dart';
import 'shimmer_effect.dart';

class CustomUAddressesShimmer extends StatelessWidget {
  const CustomUAddressesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (context, index) => SizedBox(height: CustomeSizes.spaceBtwItems),
      itemCount: 4,
      itemBuilder:
          (context, index) =>
              CustomShimmerEffect(width: double.infinity, height: 150),
    );
  }
}
