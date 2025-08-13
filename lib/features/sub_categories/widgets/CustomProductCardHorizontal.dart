import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../utils/comman/custome_rounded_image.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../../utils/utils.dart';

class CustomProductCardHorizontal extends StatelessWidget {
  const CustomProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(109, 158, 158, 158),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomeRoundedContainer(
              radius: 10,
              height: 100,
              padding: EdgeInsets.all(2),
              backgroundColor: CustomeColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: 110,
                    child: CustomeRoundedImage(
                      borderRadius: 20,
                      image: "assets/products/product 16 1 breakout jacket.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: CustomeRoundedContainer(
                      width: 35,
                      height: 25,
                      backgroundColor: CustomeColors.yellow,
                      radius: 5,
                      child: Center(child: Utils.customText("50%")),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 33,
                      height: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Iconsax.heart5,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Utils.customText(
                      "iPhone 11 with 64 GB",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 4), // instead of Spacer()

                    CustomBrantTitleWithVerifyIcons(title: "Apple"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Utils.customText(
                        "₹ 59,900",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Icon(Iconsax.add, color: Colors.white, size: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
