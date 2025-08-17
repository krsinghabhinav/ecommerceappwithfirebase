import 'package:ecommerceappwithfirebase/features/allproduct/all_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/product/product_controller.dart';
import '../../../../utils/comman/CustomHorizontalCirculerCategoryCart.dart';
import '../../../../utils/comman/GridLayout.dart';
import '../../../../utils/constants/custom_colorsd.dart';
import '../../../../utils/constants/custome_sizes.dart';
import '../../../../utils/utils.dart';
import '../../../sub_categories/sub_categories_screen.dart';
import '../../../../controller/user_controller.dart';
import 'widgets/CustomePromoSider.dart';
import 'widgets/home_screen_appbar.dart';
import 'widgets/primaryheadercontainer.dart';

import '../../../../utils/comman/custom_card_vertical.dart';
import '../../../../utils/comman/custom_section_heading_text.dart';
import '../../../../utils/comman/custom_search_bar.dart';
import '../../../../utils/constants/custom_images_path.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late UserController userController;
  late ProductController productController;
  @override
  void initState() {
    userController = Get.put(UserController());
    productController = Get.put(ProductController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<UserController>();
    Get.delete<ProductController>();
    super.dispose();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomePrimaryHeaderContainer(
                  height: CustomeSizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => HomeScreenAppBar(
                          title: getGreeting(),
                          subTitle: userController.user.value.fullName,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Utils.customText(
                          "Popular Categories",
                          color: CustomeColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: CustomHorizontalCirculerCategoryCart(),
                      ),
                    ],
                  ),
                ),
                const CustomSearchbar(),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomePromoSider(),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomeSectionHeadingText(
                title: "Popular Product",
                buttonTitle: "View all",
                onPressed: () {
                  Get.to(() => AllProductScreen());
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (productController.productFeatureList.isEmpty) {
                  return const Center(child: Text("No Product Found"));
                }

                return CustomGridLayout(
                  itemCout: productController.productFeatureList.length,
                  mainAxisExtent: Get.height * 0.32,
                  itemBuilder: (context, index) {
                    final productData =
                        productController.productFeatureList[index];
                    return CustomCardVertical(productData: productData);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
