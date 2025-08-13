import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/custom_colorsd.dart';
import '../constants/custome_sizes.dart';
import '../helpers/custom_helper_function.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.showaBackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
  });
  final Widget? title;
  final bool showaBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    bool dark = CustomHelperFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomeSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:
            showaBackArrow
                ? IconButton(
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: dark ? CustomeColors.white : CustomeColors.black,
                  ),
                  onPressed: () => Get.back(),
                )
                : leadingIcon != null
                ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
                : null,

        title: title,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
