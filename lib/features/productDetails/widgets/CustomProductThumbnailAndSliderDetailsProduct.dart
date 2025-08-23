import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/product/product_image_controller.dart';
import '../../../utils/comman/circular_icon.dart';
import '../../../utils/comman/customappbar.dart';
import '../../../utils/comman/custome_rounded_image.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../shopping/screen/wishlist/favourite/favourite_icons.dart';

class CustomProductThumbnailAndSliderDetailsProduct extends StatelessWidget {
  final ProductModel productModel;
  CustomProductThumbnailAndSliderDetailsProduct({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final productImagController = Get.put(ProductImageController());
    List<String> image = productImagController.getAllProductImages(
      productModel,
    );
    print("image=====> >>${image.length}");
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 270,
            width: double.infinity,
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  productImagController.showEnlargeImage(
                    productImagController.selectedproductImage.value,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: productImagController.selectedproductImage.value,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder:
                      (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          color: CustomeColors.primary,
                          value: progress.progress,
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
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
              itemCount: image.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Obx(() {
                    final isSelectedImage =
                        productImagController.selectedproductImage.value ==
                        image[index];
                    return CustomeRoundedImage(
                      onTab: () {
                        productImagController.selectedproductImage.value =
                            image[index];
                      },
                      isNetworkImage: true,
                      image: image[index],
                      width: 80,
                      backgroundcolor: CustomeColors.white,
                      padding: const EdgeInsets.all(5),
                      border:
                          isSelectedImage
                              ? Border.all(color: CustomeColors.primary)
                              : Border.all(color: CustomeColors.grey),
                    );
                  }),
                );
              },
            ),
          ),
        ),

        CustomAppbar(
          showaBackArrow: true,
          action: [CustomeFavouriteIcons(productId: productModel.id)],
        ),
      ],
    );
  }
}
