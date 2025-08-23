import 'package:ecommerceappwithfirebase/controller/brands_controllers.dart';
import 'package:ecommerceappwithfirebase/controller/category_controller.dart';
import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:ecommerceappwithfirebase/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/comman/custom_search_bar.dart';
import '../../../../utils/comman/custom_section_heading_text.dart';
import '../../../../utils/utils.dart';
import '../../../brands/brand_producr_screen.dart';
import '../../../brands/brands_screen.dart';
import '../home/widgets/CustomCategoryTab.dart';
import 'widgets/CustomTabBar.dart';
import 'widgets/CustomePrimaryStoreHeader.dart';
import 'widgets/customBrandCard.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final categoryController = Get.put(CategoryController());
  final brandController = Get.put(BrandsControllers());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryController.featuredCategories.length,

      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                expandedHeight: Get.height * 0.38,
                backgroundColor: Colors.transparent,

                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CustomePrimaryStoreHeader(),
                          CustomSearchbar(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomeSectionHeadingText(
                          title: "Brand",
                          buttonTitle: "View all",
                          onPressed: () {
                            Get.to(() => BrandsScreen());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Obx(() {
                          final brand = brandController.featuerList;
                          if (brandController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (brand.isEmpty) {
                            return Center(child: Text("No Brands Available"));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: brandController.featuerList.length,
                            itemBuilder: (context, index) {
                              BrandModel brandData =
                                  brandController.featuerList[index];
                              return customBrandCard(
                                brandModel: brandData,
                                onTab: () {
                                  Get.to(
                                    () => BrandProducrScreen(
                                      brandModel: brandData,
                                      title: brandData.name,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                bottom: CustomTabBar(
                  tabs:
                      categoryController.featuredCategories
                          .map(
                            (feature) =>
                                Tab(child: Utils.customText(feature.name)),
                          )
                          .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                categoryController.featuredCategories
                    .map(
                      (category) => CustomCategoryTab(categoryModel: category),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
