import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../navigation_menubar.dart';
import '../../../../utils/comman/GridLayout.dart';
import '../../../../utils/comman/custom_card_vertical.dart';

class WhishlsitScreen extends StatefulWidget {
  const WhishlsitScreen({super.key});

  @override
  State<WhishlsitScreen> createState() => _WhishlsitScreenState();
}

class _WhishlsitScreenState extends State<WhishlsitScreen> {
  NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text("WishList"),
        action: [
          IconButton(
            onPressed: () {
              navigationController.selectedIndex.value = 0;
            },
            icon: Icon(Iconsax.add),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomGridLayout(
            itemCount: 10,
            mainAxisExtent: Get.height * 0.32,
            itemBuilder: (context, index) {
              return CustomCardVertical(productData: ProductModel.empty());
            },
          ),
        ),
      ),
    );
  }
}
