import 'package:ecommerceappwithfirebase/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/brands_controllers.dart';
import '../../../../brands/brand_producr_screen.dart';
import '../../store/widgets/CustomBrandShowCase.dart';

class CategoryBrands extends StatelessWidget {
  final CategoryModel categoryModel;
  final BrandsControllers brandsControllers = Get.put(BrandsControllers());

  CategoryBrands({super.key, required this.categoryModel}) {
    brandsControllers.getBrandForCategory(categoryModel.id);
    print("category id ======> ${categoryModel.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      /// 🔹 Show one loader for all categories
      if (brandsControllers.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (brandsControllers.brandListcategories.isEmpty) {
        return const Center(child: Text("🚫 No brands found"));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: brandsControllers.brandListcategories.length,
        itemBuilder: (context, index) {
          final brand = brandsControllers.brandListcategories[index];

          return FutureBuilder(
            future: brandsControllers.getBrandProduct(brand.id, limit: 3),
            builder: (context, snapshot) {
              /// 🚫 Remove extra CircularProgressIndicator
              if (snapshot.hasError) {
                return Center(child: Text("⚠️ Error: ${snapshot.error}"));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SizedBox(); // just empty space instead of loader
              }
              final product = snapshot.data;

              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => BrandProducrScreen(
                      brandModel: brand,
                      title: brand.name,
                    ),
                  );
                },

                child: CustomBrandShowCase(
                  brandModel: brand,
                  images:
                      product!.map((pro) {
                        print("product image  ===== ${pro.thumbnail}");
                        return pro.thumbnail;
                      }).toList(),
                ),
              );
            },
          );
        },
      );
    });
  }
}
