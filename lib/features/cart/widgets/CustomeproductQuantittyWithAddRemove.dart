
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/comman/circular_icon.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../../utils/utils.dart';

class CustomeproductQuantittyWithAddRemove extends StatelessWidget {
  const CustomeproductQuantittyWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeCircularIcon(
          height: 32,
          width: 32,
          icon: Iconsax.minus,
          backgroundColor: CustomeColors.darkGrey,
          color: Colors.white,
          onPressed: () {
            // Decrease quantity logic
          },
        ),
        const SizedBox(width: 15),
    
        /// Quantity
        Utils.customText(
          "2",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
    
        const SizedBox(width: 15),
    
        /// + Icon
        CustomeCircularIcon(
          height: 32,
          width: 32,
          icon: Iconsax.add,
          backgroundColor: CustomeColors.primary,
          color: Colors.white,
          onPressed: () {
            // Increase quantity logic
          },
        ),
      ],
    );
  }
}
