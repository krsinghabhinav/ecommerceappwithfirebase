import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/utils.dart';

class CustomBillingAmountSection extends StatelessWidget {
  const CustomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Utils.customText("Subtotal"),
            Spacer(),
            Utils.customText("\$564"),
          ],
        ),
        Row(
          children: [
            Utils.customText("Shipping Fee"),
            Spacer(),
            Utils.customText("\$5"),
          ],
        ),
        Row(
          children: [
            Utils.customText("Tex Fee"),
            Spacer(),
            Utils.customText("\$15"),
          ],
        ),
        Row(
          children: [
            Utils.customText(
              "Order Total ",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            Spacer(),
            Utils.customText(
              "\$4415",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(),
      ],
    );
  }
}
