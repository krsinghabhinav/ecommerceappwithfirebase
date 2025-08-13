import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../../utils/comman/CustomProductTitle.dart';
import '../../../utils/comman/circular_icon.dart';
import '../../../utils/comman/custome_rounded_image.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../../utils/utils.dart';
import 'CustomCartitem.dart';
import 'CustomeproductQuantittyWithAddRemove.dart';

class CustomeCartItems extends StatelessWidget {
  const CustomeCartItems({super.key, this.showAddRemoveButton = true});
  final bool? showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 3, // Ideally from cartItems.length
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: CustomeColors.light,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /// Product Details Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Image
                      CustomeRoundedImage(
                        backgroundcolor: CustomeColors.light,
                        height: 80,
                        width: 90,
                        image: "assets/products/product 21.png",
                      ),

                      const SizedBox(width: 12),

                      /// Product Info
                      CustomCartitem(),
                    ],
                  ),

                  // const SizedBox(height: 5),

                  /// Quantity & Price Row
                  if (showAddRemoveButton!)
                    Row(
                      children: [
                        const SizedBox(width: 100), // align to image
                        /// - Icon
                        ///
                        CustomeproductQuantittyWithAddRemove(),

                        const Spacer(),

                        /// Price
                        const CustomProductTitle(title: "\$352"),

                        const SizedBox(width: 10),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
