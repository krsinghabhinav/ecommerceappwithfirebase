import 'package:ecommerceappwithfirebase/features/brands/brand_producr_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/brands_controllers.dart';
import '../../model/brand_model.dart';
import '../../utils/comman/GridLayout.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';
import '../shopping/screen/store/widgets/customBrandCard.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  final brandController = Get.put(BrandsControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Brands",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          final brand = brandController.brandList;
          if (brandController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (brand.isEmpty) {
            return Center(child: Text(" Brand not found"));
          }
          return CustomGridLayout(
            itemCount: brandController.brandList.length,
            mainAxisExtent: 88,
            itemBuilder: (context, index) {
              BrandModel brandModel = brandController.brandList[index];
              return customBrandCard(
                brandModel: brandModel,
                onTab: () {
                  Get.to(
                    () => BrandProducrScreen(
                      brandModel: brandModel,
                      title: brandModel.name,
                    ),
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
