import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman/CustomProductTitle.dart';
import '../../../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../../../utils/comman/custome_rounded_image.dart';
import '../../../../../utils/constants/custom_colorsd.dart';

class customBrandCard extends StatelessWidget {
  const customBrandCard({
    super.key,
    this.showBorder = true,
    this.onTab,
    this.height,
    this.width,
    required this.brandModel,
  });
  final bool showBorder;
  final VoidCallback? onTab;
  final double? height;
  final double? width;

  final BrandModel brandModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: onTab,
        child: CustomeRoundedContainer(
          height: height ?? Get.height * 0.1,
          width: width ?? Get.width * 0.47,
          showBorder: showBorder,
          radius: 13,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              SizedBox(width: 4),
              CustomeRoundedImage(
                borderRadius: 10,
                image: brandModel.image,
                width: 50,
                isNetworkImage: true,
              ),
              SizedBox(width: Get.width * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: CustomProductTitle(
                            maxlines: 1,
                            textoverflow: TextOverflow.ellipsis,
                            title: brandModel.name,
                            isSmallSize: false,
                            large: 16,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.verified,
                          size: 16,
                          color: CustomeColors.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    CustomProductTitle(
                      maxlines: 1,
                      textoverflow: TextOverflow.ellipsis,
                      title: "${brandModel.productsCount} Product",
                      isSmallSize: true,
                      small: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
