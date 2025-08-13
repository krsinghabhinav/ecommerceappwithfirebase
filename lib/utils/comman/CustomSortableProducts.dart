
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'GridLayout.dart';
import 'custom_card_vertical.dart';

class CustomSortableProducts extends StatelessWidget {
  const CustomSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 50,
            child: DropdownButtonFormField(
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              onChanged: (Value) {},
              hint: Text("Filter"),
              items:
                  ["Name", "Lower Price", "High Price", "Sale", "Newest"].map((
                    filter,
                  ) {
                    return DropdownMenuItem(child: Text(filter), value: filter);
                  }).toList(),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomGridLayout(
            itemCout: 10,
            mainAxisExtent: Get.height * 0.32,
            itemBuilder: (context, index) {
              return const CustomCardVertical();
            },
          ),
        ),
      ],
    );
  }
}
