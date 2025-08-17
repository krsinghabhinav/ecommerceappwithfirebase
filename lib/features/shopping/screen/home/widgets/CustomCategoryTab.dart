import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman/GridLayout.dart';
import '../../../../../utils/comman/custom_card_vertical.dart';
import '../../../../../utils/comman/custom_section_heading_text.dart';
import '../../store/widgets/CustomBrandShowCase.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomBrandShowCase(
          images: [
            "assets/products/product 66.png",
            "assets/products/product 63.png",
            "assets/products/product 58.png",
          ],
        ),
        CustomBrandShowCase(
          images: [
            "assets/products/product 66.png",
            "assets/products/product 63.png",
            "assets/products/product 58.png",
          ],
        ),

        CustomeSectionHeadingText(
          title: "You might like",
          buttonTitle: "View All",
        ),

        CustomGridLayout(   
          itemCout: 10,
          mainAxisExtent: Get.height * 0.32,
          itemBuilder: (context, index) {
            return CustomCardVertical(productData: ProductModel.empty(),);
          },
        ),
      ],
    );
  }
}
