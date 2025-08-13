
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/comman/customappbar.dart';
import '../../../utils/comman/custome_rounded_image.dart';
import '../../../utils/constants/custom_colorsd.dart';

class CustomProductThumbnailAndSliderDetailsProduct extends StatelessWidget {
  const CustomProductThumbnailAndSliderDetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 270,
            width: double.infinity,
            child: Image.asset(
              "assets/products/product 41.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomeRoundedImage(
                    image: "assets/products/product 25.png",
                    width: 80,
                    backgroundcolor: CustomeColors.white,
                    padding: const EdgeInsets.all(5),
                    border: Border.all(color: CustomeColors.primary),
                  ),
                );
              },
            ),
          ),
        ),

        CustomAppbar(
          showaBackArrow: true,

          action: [Icon(Iconsax.heart5, color: Colors.red)],
        ),
      ],
    );
  }
}
