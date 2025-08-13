import 'package:ecommerceappwithfirebase/utils/comman/custom_section_heading_text.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custome_rounded_image.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';
import 'widgets/CustomProductCardHorizontal.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Sport",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeSectionHeadingText(
                title: "Sport Shoes",
                buttonTitle: "View All",
                onPressed: () {},
              ),

              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: CustomProductCardHorizontal(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
