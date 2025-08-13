import 'package:ecommerceappwithfirebase/utils/comman/custom_circluer_container.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/comman/custom_shap/rounded_container.dart';
import '../../../../../utils/utils.dart';

class CustomSingleAddress extends StatelessWidget {
  const CustomSingleAddress({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: CustomeRoundedContainer(
        width: double.infinity,
        radius: 10,
        showBorder: true,
        backgroundColor:
            isSelected
                ? CustomeColors.primary.withValues(alpha: 0.7)
                : Colors.transparent,
        borderColor:
            isSelected
                ? CustomeColors.primary.withValues(alpha: 0.7)
                : Colors.black,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.customText(
                    "ABHAINAV SINGH",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        isSelected ? CustomeColors.white : CustomeColors.black,
                  ),
                  Utils.customText(
                    "+9155485256525",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                        isSelected ? CustomeColors.white : CustomeColors.black,
                  ),
                  Utils.customText(
                    "kanchana vihari marage , skdjsk sdnsdnk sndkskl skdns skndks kalyanpur near by tempu stand, lucknow",

                    // maxLines: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                        isSelected ? CustomeColors.white : CustomeColors.black,
                  ),
                ],
              ),
            ),

            if (isSelected)
              Positioned(right: 30, top: 30, child: Icon(Iconsax.tick_circle5)),
          ],
        ),
      ),
    );
  }
}
