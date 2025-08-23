import 'package:ecommerceappwithfirebase/controller/category_controller.dart';
import 'package:ecommerceappwithfirebase/features/allproduct/all_product_screen.dart';
import 'package:ecommerceappwithfirebase/model/category_model.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman/GridLayout.dart';
import '../../../../../utils/comman/custom_card_vertical.dart';
import '../../../../../utils/comman/custom_section_heading_text.dart';
import '../../store/widgets/CustomBrandShowCase.dart';
import 'category_brands.dart';

class CustomCategoryTab extends StatefulWidget {
  CategoryModel categoryModel;
  CustomCategoryTab({super.key, required this.categoryModel});

  @override
  State<CustomCategoryTab> createState() => _CustomCategoryTabState();
}

class _CustomCategoryTabState extends State<CustomCategoryTab> {
  final categoriesController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryBrands(categoryModel: widget.categoryModel),

        // CustomBrandShowCase(
        //   images: [
        //     "assets/products/product 66.png",
        //     "assets/products/product 63.png",
        //     "assets/products/product 58.png",
        //   ],
        // ),
        CustomeSectionHeadingText(
          title: "You might like",
          buttonTitle: "View All",
          onPressed:
              () => Get.to(
                () => AllProductScreen(
                  title: widget.categoryModel.name,
                  futureMethod: categoriesController.getCategoriesProduct(
                    categoryId: widget.categoryModel.id,
                    limit: -1,
                  ),
                ),
              ),
        ),
        FutureBuilder(
          future: categoriesController.getCategoriesProduct(
            categoryId: widget.categoryModel.id,
            limit: 4,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            /// 🚫 Remove extra CircularProgressIndicator
            if (snapshot.hasError) {
              return Center(child: Text("⚠️ Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("🚫 No products found"));
            }
            final product = snapshot.data;

            return CustomGridLayout(
              itemCount: product!.length,
              mainAxisExtent: Get.height * 0.32,
              itemBuilder: (context, index) {
                final productData = product[index];

                return CustomCardVertical(productData: productData);
              },
            );
          },
        ),
      ],
    );
  }
}
