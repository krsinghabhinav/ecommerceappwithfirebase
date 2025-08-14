import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/validators/validation.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/comman/customappbar.dart';
import 'controller/change_name_controller.dart';

class ChangeUsernameScreeen extends StatefulWidget {
  const ChangeUsernameScreeen({super.key});

  @override
  State<ChangeUsernameScreeen> createState() => _ChangeUsernameScreeenState();
}

class _ChangeUsernameScreeenState extends State<ChangeUsernameScreeen> {
  final ChangeNameController changeNameController = Get.put(
    ChangeNameController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: const Text("Change Name"),
      ),
      body: Stack(
        children: [
          /// Main content
          Padding(
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
                  controller: changeNameController.firstNameController,
                  prefixIcon: Iconsax.user_edit,
                ),
                SizedBox(height: Get.height * .02),
                Utils.customTextFormField(
                  label: "Last Name",
                  hintText: "Last Name",
                  controller: changeNameController.lastNameController,
                  prefixIcon: Iconsax.user_edit,
                ),
                SizedBox(height: Get.height * .02),
                Utils.customButton(
                  text: "Save",
                  onTap: () {
                    changeNameController.updateName();
                  },
                ),
              ],
            ),
          ),

          /// Fullscreen loader overlay
          Obx(() {
            if (changeNameController.isLoading.value) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.4), // semi-transparent bg
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
