import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/comman/CustomSortableProducts.dart';
import '../../utils/comman/GridLayout.dart';
import '../../utils/comman/custom_card_vertical.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Sport",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(child: CustomSortTableProduts()),
    );
  }
}

class CustomSortTableProduts extends StatelessWidget {
  const CustomSortTableProduts({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSortableProducts();
  }
}
