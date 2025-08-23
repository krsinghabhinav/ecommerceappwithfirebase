import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../controller/product/favoruite_controller.dart';
import '../../../../navigation_menubar.dart';
import '../../../../utils/comman/GridLayout.dart';
import '../../../../utils/comman/custom_card_vertical.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final navigationController = Get.put(NavigationController());
  final favouritesController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: const Text("Wishlist"),
        action: [
          IconButton(
            onPressed: () {
              navigationController.selectedIndex.value = 0;
            },
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => FutureBuilder(
            future: favouritesController.getFavouritesProducts(),
            builder: (context, snapshot) {
              // Loading state
              if (snapshot.connectionState == ConnectionState.waiting ||
                  favouritesController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // Error state
              if (snapshot.hasError) {
                return Center(child: Text("⚠️ Error: ${snapshot.error}"));
              }

              final products = snapshot.data ?? [];

              // Empty state
              if (products.isEmpty) {
                return const Center(child: Text("🚫 No products found"));
              }

              // Data state
              return CustomGridLayout(
                itemCount: products.length,
                mainAxisExtent: Get.height * 0.32,
                itemBuilder: (context, index) {
                  final productData = products[index];
                  return CustomCardVertical(productData: productData);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
