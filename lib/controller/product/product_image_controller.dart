import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custome_sizes.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageController extends GetxController {
  var isLoading = false.obs;

  // Use for selected image if multiple images exist for the same product
  RxString selectedproductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    List<String> images = [];

    // 1️⃣ Load thumbnail image
    if (product.thumbnail.isNotEmpty) {
      images.add(product.thumbnail);

      // Assign thumbnail as selected image
      selectedproductImage.value = product.thumbnail;
    }

    // 2️⃣ Load all product images
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    // 3️⃣ Load variation images in a separate list
    List<String> variationImages = [];
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        if (variation.image.isNotEmpty) {
          variationImages.add(variation.image);
        }
      }
    }

    // 4️⃣ Merge variation images into main list
    images.addAll(variationImages);

    // 5️⃣ Remove duplicates (if same image appears multiple times)
    images = images.toSet().toList();

    return images;
  }

  void showEnlargeImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CustomeSizes.defaultSpace * 2,
                  horizontal: CustomeSizes.defaultSpace,
                ),
                child: CachedNetworkImage(imageUrl: image),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            // Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Utils.customOutlinedButton(
                width: Get.width * 0.4,
                text: "Close",
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),
    );
  }
}
