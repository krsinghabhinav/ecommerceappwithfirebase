import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/comman/CustomProductTitle.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_circluer_container.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_section_heading_text.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import '../../../controller/product/product_variation_controller.dart';
import '../../../utils/comman/CustomChoiceChip.dart';
import '../../../utils/utils.dart';
import 'package:readmore/readmore.dart';

class ProductAttributes extends StatelessWidget {
  final ProductModel productModel;
  const ProductAttributes({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final variationAttributeController = Get.put(ProductVariationController());
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Obx(
        () => Column(
          children: [
            if (variationAttributeController
                .selectedVariation
                .value
                .id
                .isNotEmpty)
              CustomeRoundedContainer(
                radius: 20,
                padding: const EdgeInsets.all(10),
                backgroundColor: CustomeColors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // ✅ Centered
                      children: [
                        // Left section: Variation label
                        Flexible(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Utils.customText(
                              'Variation',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),

                        // Right section: Price & Stock info
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Utils.customText('Price', fontSize: 16),
                                  const SizedBox(width: 8),

                                  if (variationAttributeController
                                          .selectedVariation
                                          .value
                                          .salePrice >
                                      0)
                                    Obx(
                                      () => Utils.customText(
                                        "${CustomText.currency}${variationAttributeController.selectedVariation.value.price.toStringAsFixed(0)}",
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  const SizedBox(width: 8),

                                  Obx(
                                    () => Utils.customText(
                                      variationAttributeController
                                          .getVariationPrice(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Utils.customText('Stock', fontSize: 16),
                                  const SizedBox(width: 8),
                                  Utils.customText(
                                    variationAttributeController
                                        .variationStockStatus
                                        .value,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    variationAttributeController
                            .selectedVariation
                            .value
                            .description!
                            .isNotEmpty
                        ? Utils.customText(
                          variationAttributeController
                                  .selectedVariation
                                  .value
                                  .description ??
                              "",
                          fontSize: 16,
                        )
                        : SizedBox(),
                  ],
                ),
              ),

            // attribute for color
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  productModel.productAttributes!.map((attribute) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CustomeSectionHeadingText(title: attribute.name ?? ""),
                        Obx(
                          () => Wrap(
                            children:
                                attribute.values!.map((attributeValue) {
                                  bool isSelected =
                                      variationAttributeController
                                          .selectedAttributes[attribute.name] ==
                                      attributeValue;

                                  bool available = variationAttributeController
                                      .getAttributeAvailabelityInVariation(
                                        productModel.productVariations!,
                                        attribute.name!,
                                      )
                                      .contains(attributeValue);
                                  return CustomChoiceChip(
                                    title: attributeValue,
                                    selected: isSelected,
                                    onSelected:
                                        available
                                            ? (selected) {
                                              if (available && selected) {
                                                variationAttributeController
                                                    .onAttributeSelected(
                                                      productModel,
                                                      attribute.name!,
                                                      attributeValue,
                                                    );
                                              }
                                            }
                                            : null,
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
            /*   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var attribute in productModel.productAttributes!)
                if (attribute.values != null &&
                    attribute.values!.isNotEmpty) ...[
                  CustomeSectionHeadingText(title: attribute.name ?? ""),
                  Wrap(
                    children: [
                      for (var attributeValue in attribute.values!)
                        if (variationAttributeController
                                .selectedAttributes[attribute.name] ==
                            attributeValue) ...[
                          CustomChoiceChip(
                            title: attributeValue,
                            selected: true,
                            onSelected: (p0) {},
                          ),
                        ] else if (variationAttributeController
                                .selectedAttributes[attribute.name] !=
                            attributeValue) ...[
                          CustomChoiceChip(
                            title: attributeValue,
                            selected: false,
                            onSelected: (p0) {},
                          ),
                        ],
                    ],
                  ),
                ],
            ],
          ), */
            // attribute for color
            /*  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeSectionHeadingText(title: "Storage"),
              Wrap(
                children: [
                  CustomChoiceChip(
                    title: "Small",
                    selected: true,
                    onSelected: (p0) {},
                  ),
                  CustomChoiceChip(
                    title: "Medium",
                    selected: false,
                    onSelected: (p0) {},
                  ),
                  CustomChoiceChip(
                    title: "Large",
                    selected: false,
                    onSelected: (p0) {},
                  ),
                ],
              ),
            ],
          ), */
            /*  SizedBox(height: Get.height * 0.01),
          Utils.customButton(text: "Check Out", onTap: () {}), */

            /*    CustomeSectionHeadingText(title: "Description"),
          ReadMoreText(
            productModel.description ?? "",
            trimMode: TrimMode.Line,
            trimLines: 3,
            colorClickableText: Colors.black,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ), */
            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),
    );
  }
}
