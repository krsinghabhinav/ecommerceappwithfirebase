import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // for Iconsax.call and Iconsax.user

import '../../../utils/comman/custom_section_heading_text.dart';
import '../../../utils/utils.dart';
import '../../../utils/constants/custom_colorsd.dart'; // Assuming your color file is here

class CustomAddressSection extends StatefulWidget {
  const CustomAddressSection({super.key});

  @override
  State<CustomAddressSection> createState() => _CustomAddressSectionState();
}

class _CustomAddressSectionState extends State<CustomAddressSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeSectionHeadingText(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        Utils.customText(
          "Abhinav Singh",
          fontSize: 18,
          color: CustomeColors.black,
          fontWeight: FontWeight.w800,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Iconsax.call),
            const SizedBox(width: 10),
            Utils.customText(
              "7525827482",
              fontSize: 16,
              color: CustomeColors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.user),
            const SizedBox(width: 10),
            Expanded(
              child: Utils.customText(
                "House No.295, Hyderabad, Sindh, Pakistan, 72300",
                maxLines: 3,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
                color: CustomeColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
