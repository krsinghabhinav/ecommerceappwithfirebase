import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/comman/customappbar.dart';

class ChangeUsernameScreeen extends StatefulWidget {
  const ChangeUsernameScreeen({super.key});

  @override
  State<ChangeUsernameScreeen> createState() => _ChangeUsernameScreeenState();
}

class _ChangeUsernameScreeenState extends State<ChangeUsernameScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: const Text("Change Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * .02),
            Utils.customText(
              "Update your name to keep your profile accurate and personalized",
              fontSize: 14,
              color: CustomeColors.darkGrey,
            ),
            SizedBox(height: Get.height * .02),
            Utils.customTextFormField(
              label: "First Name",
              hintText: "First Name",
              controller: TextEditingController(),
              prefixIcon: Iconsax.user_edit,
            ),
            SizedBox(height: Get.height * .02),

            Utils.customTextFormField(
              label: "Last Name",
              hintText: "Last Name",
              controller: TextEditingController(),
              prefixIcon: Iconsax.user_edit,
            ),
            SizedBox(height: Get.height * .02),
            Utils.customButton(text: "Save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
