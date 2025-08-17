import 'package:ecommerceappwithfirebase/controller/product/product_controller.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'GridLayout.dart';
import 'custom_card_vertical.dart';

class CustomSortableProducts extends StatefulWidget {
  final List<ProductModel> products; // ✅ accepts list of products
  const CustomSortableProducts({super.key, required this.products});

  @override
  State<CustomSortableProducts> createState() => _CustomSortableProductsState();
}

class _CustomSortableProductsState extends State<CustomSortableProducts> {
  final productController = Get.put(ProductController());

  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown Filter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 50,
            child: DropdownButtonFormField<String>(
              value: selectedFilter,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value;
                });
                // TODO: You can implement actual sorting logic here using setState
              },
              hint: const Text("Filter"),
              items:
                  ["Name", "Lower Price", "High Price", "Sale", "Newest"].map((
                    filter,
                  ) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// Products Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomGridLayout(
            itemCount: widget.products.length, // ✅ corrected itemCount
            mainAxisExtent: Get.height * 0.32,
            itemBuilder: (context, index) {
              return CustomCardVertical(
                productData: widget.products[index], // ✅ pass each product
              );
            },
          ),
        ),
      ],
    );
  }
}
