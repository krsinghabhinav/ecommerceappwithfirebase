import 'package:ecommerceappwithfirebase/utils/comman/circular_icon.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/utils.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0), // Added right padding
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: CustomeColors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Centered the row
          children: [
            CustomeCircularIcon(
              height: 40,
              width: 40,
              color: CustomeColors.white,
              icon: Iconsax.minus,
              backgroundColor: CustomeColors.darkGrey,
            ),
            const SizedBox(width: 15),
            Utils.customText("2", fontSize: 22, fontWeight: FontWeight.w600),
            const SizedBox(width: 15),
            CustomeCircularIcon(
              height: 40,
              width: 40,
              color: CustomeColors.white,
              icon: Iconsax.add,
              backgroundColor: CustomeColors.black,
            ),
            Spacer(),
            Utils.checkoutButton(
              text: "Add to Cart",
              width: 170,
              onTap: () {},
              backgroundColor: Colors.black,
              icon: Icon(Iconsax.shop, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
  