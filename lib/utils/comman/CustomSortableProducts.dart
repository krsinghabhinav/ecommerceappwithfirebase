import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/material.dart';
import 'GridLayout.dart';
import 'custom_card_vertical.dart';

class CustomSortableProducts extends StatefulWidget {
  final List<ProductModel> products;
  const CustomSortableProducts({super.key, required this.products});

  @override
  State<CustomSortableProducts> createState() => _CustomSortableProductsState();
}

class _CustomSortableProductsState extends State<CustomSortableProducts> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 50,
            child: DropdownButtonFormField<String>(
              value: selectedFilter,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value;
                });
              },
              hint: const Text("Filter"),
              items:
                  ["Name", "Lower Price", "High Price", "Sale", "Newest"]
                      .map(
                        (filter) => DropdownMenuItem<String>(
                          value: filter,
                          child: Text(filter),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomGridLayout(
            itemCount: widget.products.length,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.32,
            itemBuilder: (context, index) {
              return CustomCardVertical(productData: widget.products[index]);
            },
          ),
        ),
      ],
    );
  }
}
