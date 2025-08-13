import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/comman/customappbar.dart';
import '../../utils/comman/CustomBrantTitleWithVerifyIcons.dart';
import '../../utils/comman/CustomProductTitle.dart';
import '../../utils/comman/circular_icon.dart';
import '../../utils/comman/custome_rounded_image.dart';
import '../../utils/constants/custom_colorsd.dart';
import '../../utils/utils.dart';
import '../checkOut/check_out_screen.dart';
import 'widgets/CustomeCartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          showaBackArrow: true,
          title: Utils.customText(
            "Cart",
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      body: Column(
        children: [
          Flexible(child: CustomeCartItems()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Utils.customButton(
              text: "CheckOut \$1345",
              onTap: () {
                Get.to(() => CheckOutScreen());
              },
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
