import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomOrderListItem extends StatefulWidget {
  const CustomOrderListItem({super.key});

  @override
  State<CustomOrderListItem> createState() => _CustomOrderListItemState();
}

class _CustomOrderListItemState extends State<CustomOrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomeRoundedContainer(
              showBorder: true,
              backgroundColor: CustomeColors.white,
              radius: 12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Iconsax.ship, size: 30),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Utils.customText(
                              "Processing",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: CustomeColors.primary,
                            ),
                            Utils.customText(
                              "01 Jan 2025",
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Iconsax.arrow_right_34, size: 30),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Iconsax.tag, size: 30),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Utils.customText(
                                  "Order",
                                  fontSize: 16,
                                  color: CustomeColors.primary,
                                ),
                                Utils.customText(
                                  "GYS324",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Iconsax.calendar, size: 30),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Utils.customText(
                                  "Order",
                                  fontSize: 16,
                                  color: CustomeColors.primary,
                                ),
                                Utils.customText(
                                  "06 Jan 2025",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
