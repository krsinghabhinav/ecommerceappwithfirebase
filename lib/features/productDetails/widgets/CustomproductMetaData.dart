import 'package:flutter/material.dart';

import '../../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../../utils/comman/CustomProductTitle.dart';
import '../../../utils/comman/circular_image.dart';
import '../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../utils/constants/custom_colorsd.dart';
import '../../../utils/utils.dart';

class CustomproductMetaData extends StatelessWidget {
  const CustomproductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomeRoundedContainer(
                width: 40,
                height: 30,
                backgroundColor: CustomeColors.yellow,
                radius: 8,
                child: Center(child: Utils.customText("50%")),
              ),
              SizedBox(width: 20),
              Utils.customText(
                "\$250",
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
              ),
              Utils.customText(
                " - \$350 ",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              SizedBox(width: 10),
            ],
          ),
          CustomProductTitle(
            title: "Blue Shoes of Nike ",
            isSmallSize: false,
            large: 20,
          ),
          Row(
            children: [
              CustomProductTitle(
                title: "Status ",
                isSmallSize: true,
                small: 18,
              ),
              CustomProductTitle(
                title: "In Stock",
                isSmallSize: false,
                large: 18,
              ),
            ],
          ),
          Row(
            children: [
              CustomCircularImage(image: "assets/brands/bata.png"),
              CustomBrantTitleWithVerifyIcons(title: "Apple"),
            ],
          ),
        ],
      ),
    );
  }
}
