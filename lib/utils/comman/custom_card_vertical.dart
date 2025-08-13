import 'package:ecommerceappwithfirebase/utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../../features/productDetails/product_details.dart';
import '../constants/custom_colorsd.dart';
import 'CustomProductTitle.dart';
import 'CustomproductPrice.dart';

class CustomCardVertical extends StatelessWidget {
  const CustomCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetailsScreen());
        },
        child: Container(
          width: Get.width * 0.45,
          decoration: BoxDecoration(
            color: CustomeColors.primary.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.01),

              Center(
                child: CustomeRoundedContainer(
                  width: Get.width * 0.4,
                  height: Get.height * 0.2,
                  radius: 10,
                  backgroundColor: CustomeColors.white,
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Image(
                            image: AssetImage("assets/products/product 34.png"),
                            fit: BoxFit.contain,
                            height: 120,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 3,
                        child: CustomeRoundedContainer(
                          width: 40,
                          height: 30,
                          backgroundColor: CustomeColors.yellow,
                          radius: 8,
                          child: Center(child: Utils.customText("50%")),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Container(
                          width: 36,
                          height: 36,
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
              SizedBox(height: Get.height * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomProductTitle(
                      title: "iPhone 11 64GB",
                      isSmallSize: false,
                      large: 16,
                    ),
                    CustomBrantTitleWithVerifyIcons(title: "Apple"),
                    SizedBox(height: Get.height * 0.002),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomproductPrice(
                          price: "\$234-\$343",
                          isLarge: true,
                          lg: Get.height * 0.021,
                        ),
                        Container(
                          height: 35,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Iconsax.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
