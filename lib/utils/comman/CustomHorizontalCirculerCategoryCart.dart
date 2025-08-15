import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/category_controller.dart';
import '../../features/sub_categories/sub_categories_screen.dart';
import '../constants/custom_colorsd.dart';
import '../utils.dart';
import 'custom_circluer_container.dart';

class CustomHorizontalCirculerCategoryCart extends StatelessWidget {
  const CustomHorizontalCirculerCategoryCart({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return SizedBox(
      height: Get.height * 0.2,
      child: Obx(() {
        var catlist = categoryController.featuredCategories;
        // if (categoryController.isLoading.value) {
        //   return const Center(child: CircularProgressIndicator());
        // }

        if (catlist.isEmpty) {
          return const Center(child: Text('No categories found'));
        }
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: catlist.length,
          itemBuilder: (context, index) {
            final category = catlist[index]; // CategoryModel

            return GestureDetector(
              onTap: () {
                // Navigate to subcategory screen with that category
                // Example:
                // Get.to(() => SubCategoriesScreen(category: category));
              },
              child: Column(
                children: [
                  customcirculercontainer(
                    height: Get.height * 0.075,
                    width: Get.height * 0.075,
                    radius: Get.height * 0.075 / 2,
                    backgroundColor: Colors.white, // you can style here
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: category.image ?? "",
                        fit: BoxFit.contain,
                        height: Get.height * 0.04,
                        width: Get.height * 0.04,
                        errorWidget:
                            (context, url, error) =>
                                const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Utils.customText(
                    category.name ?? "",
                    color: CustomeColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
