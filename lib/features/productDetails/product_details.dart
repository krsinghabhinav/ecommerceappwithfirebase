import 'package:ecommerceappwithfirebase/utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import 'package:ecommerceappwithfirebase/utils/comman/CustomProductTitle.dart';
import 'package:ecommerceappwithfirebase/utils/comman/circular_image.dart';
import 'package:ecommerceappwithfirebase/utils/comman/customappbar.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custome_rounded_image.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/comman/custom_section_heading_text.dart';
import '../../utils/comman/custom_shap/rounded_container.dart';
import '../../utils/utils.dart';
import 'widgets/CustomBottomNavigationBar.dart';
import 'widgets/CustomProductThumbnailAndSliderDetailsProduct.dart';
import 'widgets/CustomproductMetaData.dart';
import 'widgets/product_attributes.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomProductThumbnailAndSliderDetailsProduct(),
              CustomproductMetaData(),
              ProductAttributes(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
