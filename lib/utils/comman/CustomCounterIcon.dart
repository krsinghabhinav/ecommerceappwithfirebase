import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../features/cart/cart_screen.dart';
import '../constants/custom_colorsd.dart';
import '../utils.dart';

class CustomCounterIcon extends StatelessWidget {
  const CustomCounterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Iconsax.shopping_bag,
              color: CustomeColors.white,
              size: 26,
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CartScreen());
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: CustomeColors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Utils.customText(
                    "2", // You can replace with a dynamic value
                    color: CustomeColors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
