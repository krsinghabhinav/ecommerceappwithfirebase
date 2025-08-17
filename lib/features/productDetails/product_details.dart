import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import 'package:ecommerceappwithfirebase/utils/comman/CustomProductTitle.dart';
import 'package:ecommerceappwithfirebase/utils/comman/circular_image.dart';
import 'package:ecommerceappwithfirebase/utils/comman/customappbar.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custome_rounded_image.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../utils/comman/custom_section_heading_text.dart';
import '../../utils/comman/custom_shap/rounded_container.dart';
import '../../utils/utils.dart';
import 'widgets/CustomBottomNavigationBar.dart';
import 'widgets/CustomProductThumbnailAndSliderDetailsProduct.dart';
import 'widgets/CustomproductMetaData.dart';
import 'widgets/product_attributes.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel productModel;
  ProductDetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomProductThumbnailAndSliderDetailsProduct(
                productModel: productModel,
              ),
              CustomproductMetaData(productModel: productModel),
              // SizedBox(height: 10),
              if (productModel.productType == "ProductType.variable") ...[
                ProductAttributes(productModel: productModel),
              ],
              SizedBox(height: Get.height * 0.01),
              Utils.customButton(
                text: "Check Out",
                onTap: () {},
                width: Get.width * 0.9,
              ),
              CustomeSectionHeadingText(title: "Description"),
              ReadMoreText(
                productModel.description ?? "",
                trimMode: TrimMode.Line,
                trimLines: 3,
                colorClickableText: Colors.black,
                trimCollapsedText: 'Show more',
                trimExpandedText: ' Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
