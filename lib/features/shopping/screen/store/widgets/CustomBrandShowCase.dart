import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../../../utils/constants/custom_colorsd.dart';
import '../store_screen.dart';
import 'customBrandCard.dart';

class CustomBrandShowCase extends StatelessWidget {
  const CustomBrandShowCase({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: CustomeRoundedContainer(
        showBorder: true,
        borderColor: CustomeColors.primary,
        backgroundColor: Colors.transparent,
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBrandCard(showBorder: false, brandModel: BrandModel.empty()),
            // ✅ Scrollable row for brand images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    images.map((image) => buildBrandImage(image)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Do NOT use Expanded here
Widget buildBrandImage(String image) {
  return CustomeRoundedContainer(
    height: 100,
    width: 100, // Set width instead of using Expanded
    margin: EdgeInsets.only(right: 12, bottom: 5),
    // padding: EdgeInsets.all(8),
    backgroundColor: const Color.fromARGB(66, 199, 199, 199),
    child: Image(image: AssetImage(image)),
  );
}
