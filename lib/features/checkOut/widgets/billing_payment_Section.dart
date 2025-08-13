import 'package:ecommerceappwithfirebase/utils/comman/custom_section_heading_text.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/utils.dart';
import 'custom_address_section.dart';

class BillingPaymentSection extends StatefulWidget {
  const BillingPaymentSection({super.key});

  @override
  State<BillingPaymentSection> createState() => _BillingPaymentSectionState();
}

class _BillingPaymentSectionState extends State<BillingPaymentSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeSectionHeadingText(
          title: "Payment Method",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Row(
          children: [
            CustomeRoundedContainer(
              width: 80,
              height: 80,
              backgroundColor: CustomeColors.white,

              child: Image(
                image: AssetImage(
                  "assets/icons/payment_methods/master-card.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 20),
            Utils.customText(
              "Master Card",
              fontSize: 18,
              color: CustomeColors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        CustomAddressSection(),
        SizedBox(height: 20),
      ],
    );
  }
}
