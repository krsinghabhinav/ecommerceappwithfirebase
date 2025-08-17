import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controller/product/product_controller.dart';
import '../../features/productDetails/product_details.dart';
import '../constants/custom_colorsd.dart';
import 'CustomProductTitle.dart';
import 'CustomproductPrice.dart';

class CustomCardVertical extends StatelessWidget {
  final ProductModel productData;
  const CustomCardVertical({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    String? salePercentage = productController.calculateSalePrecentage(
      productData.price,
      productData.salePrice,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetailsScreen(productModel: productData));
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
                  // height: Get.height * 0.2,
                  radius: 10,
                  backgroundColor: CustomeColors.white,
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Image(
                            image:
                                productData.thumbnail != null &&
                                        productData.thumbnail.isNotEmpty
                                    ? CachedNetworkImageProvider(
                                      productData.thumbnail,
                                    )
                                    : const AssetImage(
                                          "assets/images/placeholder.png",
                                        )
                                        as ImageProvider,
                            fit: BoxFit.contain,
                            height: Get.height * 0.16,
                          ),
                        ),
                      ),

                      if (salePercentage != "0")
                        Positioned(
                          left: 1,
                          top: 1,
                          child: CustomeRoundedContainer(
                            width: 40,
                            height: 27,
                            backgroundColor: CustomeColors.yellow,
                            radius: 8,
                            child: Center(
                              child: Utils.customText(
                                "${salePercentage}%",
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 1,
                        right: 1,
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
                      title: productData.title ?? "Untitled Product",
                      isSmallSize: false,
                      large: 14,
                      maxlines: 2,
                      color: Colors.grey.shade800,
                    ),
                    CustomBrantTitleWithVerifyIcons(
                      title: productData.brand?.name ?? "Unknown Brand",
                    ),
                    SizedBox(height: Get.height * 0.0025),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomproductPrice(
                          price:
                              "${productController.getDisplayPrice(productData) ?? "0"}",
                          isLarge: true,
                          lg: Get.height * 0.02,
                          color: Colors.grey.shade800,
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
