import 'package:ecommerceappwithfirebase/utils/comman/customappbar.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import 'widget/CustomSingleAddress.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "Add New Address",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Utils.customTextFormField(
                label: "Name",
                hintText: "Name",
                controller: TextEditingController(),
                prefixIcon: Iconsax.user,
              ),
              SizedBox(height: Get.height * 0.02),
              Utils.customTextFormField(
                label: "Phone Number",
                hintText: "Name Number",
                controller: TextEditingController(),
                prefixIcon: Iconsax.call,
              ),
              SizedBox(height: Get.height * 0.02),

              Row(
                children: [
                  Flexible(
                    child: Utils.customTextFormField(
                      label: "Street",
                      hintText: "Street",
                      controller: TextEditingController(),
                      prefixIcon: Iconsax.location,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.04),

                  Flexible(
                    child: Utils.customTextFormField(
                      label: "Postal Code",
                      hintText: "Postal Code",
                      controller: TextEditingController(),
                      prefixIcon: Iconsax.code,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),

              Row(
                children: [
                  Flexible(
                    child: Utils.customTextFormField(
                      label: "City",
                      hintText: "City",
                      controller: TextEditingController(),
                      prefixIcon: Iconsax.building_3,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.04),

                  Flexible(
                    child: Utils.customTextFormField(
                      label: "State",
                      hintText: "State",
                      controller: TextEditingController(),
                      prefixIcon: Iconsax.global_edit,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),

              Utils.customTextFormField(
                label: "Country",
                hintText: "Country",
                controller: TextEditingController(),
                prefixIcon: Iconsax.flag,
              ),
              SizedBox(height: Get.height * 0.02),

              Utils.customButton(text: "Save", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
