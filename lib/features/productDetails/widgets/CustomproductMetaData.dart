import 'package:ecommerceappwithfirebase/controller/product/product_controller.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product/product_image_controller.dart';
import '../../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../../utils/comman/CustomProductTitle.dart';
import '../../../utils/comman/circular_image.dart';
import '../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../../utils/utils.dart';

class CustomproductMetaData extends StatelessWidget {
  final ProductModel productModel;
  const CustomproductMetaData({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final productImagController = Get.put(ProductImageController());
    final productController = Get.put(ProductController());
    final salePercentage = productController.calculateSalePrecentage(
      productModel.price,
      productModel.salePrice,
    );
    List<String> image = productImagController.getAllProductImages(
      productModel,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (salePercentage != '0') ...[
                CustomeRoundedContainer(
                  width: 40,
                  height: 30,
                  backgroundColor: CustomeColors.yellow,
                  radius: 8,
                  child: Center(child: Utils.customText("${salePercentage}%")),
                ),
                SizedBox(width: 20),
              ],
              if (productModel.productType == "ProductType.single" &&
                  productModel.salePrice > 0) ...[
                Utils.customText(
                  "${CustomText.currency}${productModel.price.toStringAsFixed(0)}",
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                ),
              ],

              Utils.customText(
                productController.getDisplayPrice(productModel),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              SizedBox(width: 10),
            ],
          ),
          CustomProductTitle(
            title: productModel.title,
            isSmallSize: false,
            large: 18,
            maxlines: 2,
            color: Colors.grey.shade800,
          ),
          Row(
            children: [
              CustomProductTitle(
                title: "Status ",
                isSmallSize: true,
                small: 16,
                color: Colors.grey.shade800,
              ),
              CustomProductTitle(
                title: productController.getProductStatusStock(
                  productModel.stock,
                ),
                isSmallSize: false,
                large: 16,
                color: Colors.grey.shade800,
              ),
            ],
          ),
          Row(
            children: [
              CustomCircularImage(
                borderColor: Colors.transparent,
                showBorder: false,
                image:
                    productModel.brand != null ? productModel.brand!.image : "",
                isNetworkImage: true,
              ),
              CustomBrantTitleWithVerifyIcons(
                title:
                    productModel.brand != null ? productModel.brand!.name : "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
