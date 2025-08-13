import 'package:ecommerceappwithfirebase/features/cart/widgets/CustomeCartItem.dart';
import 'package:ecommerceappwithfirebase/navigation_menubar.dart';
import 'package:ecommerceappwithfirebase/utils/comman/custom_shap/rounded_container.dart';
import 'package:ecommerceappwithfirebase/utils/comman/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';
import 'widgets/CustomBillingAmountSection.dart';
import 'widgets/CustomPromoCodeField.dart';
import 'widgets/billing_payment_Section.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Order Review",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomeCartItems(showAddRemoveButton: false),
              const SizedBox(height: 8),

              CustomPromoCodeField(),
              const SizedBox(height: 15),
              CustomeRoundedContainer(
                showBorder: true,
                radius: 8,
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      child: CustomBillingAmountSection(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: BillingPaymentSection(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Utils.customButton(
          text: "CheckOut \$1345",
          onTap: () {
            Get.to(
              () => SuccessScreen(
                title: "Payment Success!",
                subtitle: "Your item will be shipped soon!",
                imageurl:
                    "assets/icons/payment_methods/successful_payment_icon.png",
                onTap: () {
                  Get.offAll(() => NavigationMenubar());
                },
              ),
            );
          },
          fontSize: 18,
        ),
      ),
    );
  }
}
