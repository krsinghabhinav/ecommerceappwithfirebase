import 'package:ecommerceappwithfirebase/features/shopping/screen/store/widgets/customBrandCard.dart';
import 'package:flutter/material.dart';

import '../../utils/comman/CustomSortableProducts.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';
import '../allproduct/all_product_screen.dart';

class BrandProducrScreen extends StatefulWidget {
  const BrandProducrScreen({super.key});

  @override
  State<BrandProducrScreen> createState() => _BrandProducrScreenState();
}

class _BrandProducrScreenState extends State<BrandProducrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Bata",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: customBrandCard(width: double.infinity),
            ),
            SizedBox(height: 20),
            CustomSortableProducts(),
          ],
        ),
      ),
    );
  }
}
