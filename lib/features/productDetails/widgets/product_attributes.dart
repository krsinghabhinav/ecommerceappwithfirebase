import 'package:ecommerceappwithfirebase/utils/comman/CustomProductTitle.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_circluer_container.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_section_heading_text.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import '../../../utils/comman/CustomChoiceChip.dart';
import '../../../utils/utils.dart';
import 'package:readmore/readmore.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CustomeRoundedContainer(
            radius: 20,
            padding: const EdgeInsets.all(10),
            backgroundColor: CustomeColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // ✅ Centered
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
                              Utils.customText(
                                "\$250",
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                              const SizedBox(width: 8),
                              Utils.customText(
                                "\$360",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Utils.customText('Stock', fontSize: 16),
                              const SizedBox(width: 8),
                              Utils.customText(
                                "In Stock",
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
                Utils.customText(
                  "This is a Product of iPhone 11 with 512 GB",
                  fontSize: 16,
                ),
              ],
            ),
          ),

          // attribute for color
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeSectionHeadingText(title: "Color"),
              Wrap(
                children: [
                  CustomChoiceChip(
                    title: "Red",
                    selected: true,
                    onSelected: (p0) {},
                  ),
                  CustomChoiceChip(
                    title: "Blue",
                    selected: true,
                    onSelected: (p0) {},
                  ),
                  CustomChoiceChip(
                    title: "Orange",
                    selected: true,
                    onSelected: (p0) {},
                  ),
                ],
              ),
            ],
          ),
          // attribute for color
          Column(
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
                    selected: true,
                    onSelected: (p0) {},
                  ),
                  CustomChoiceChip(
                    title: "Large",
                    selected: true,
                    onSelected: (p0) {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.02),
          Utils.customButton(text: "Check Out", onTap: () {}),
          CustomeSectionHeadingText(title: "Description"),
          ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: Colors.black,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: Get.height * 0.02),
        ],
      ),
    );
  }
}
