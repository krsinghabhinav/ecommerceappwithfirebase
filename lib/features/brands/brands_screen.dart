import 'package:ecommerceappwithfirebase/features/brands/brand_producr_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: CustomGridLayout(
          itemCout: 20,
          mainAxisExtent: 88,
          itemBuilder: (context, index) {
            return customBrandCard(
              onTab: () {
                Get.to(() => BrandProducrScreen());
              },
            );
          },
        ),
      ),
    );
  }
}
