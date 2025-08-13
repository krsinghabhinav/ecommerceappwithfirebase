import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custome_sizes.dart';
import '../../../../../utils/utils.dart';
import '../edit_screen.dart';

class CustomUserProfileTile extends StatelessWidget {
  const CustomUserProfileTile({super.key, this.nameText, this.emailText});
  final String? nameText;
  final String? emailText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Utils.customText(
        nameText ?? "",
        fontSize: CustomeSizes.mlg,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Utils.customText(emailText ?? ""),
      trailing: IconButton(
        onPressed: () {
          Get.to(() => EditScreen());
        },
        icon: Icon(Iconsax.edit),
      ),
    );
  }
}
