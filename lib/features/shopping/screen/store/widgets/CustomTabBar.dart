

import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_colorsd.dart';
import '../../../../../utils/helpers/custom_device_helper.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs, this.title});
  final List<Widget> tabs;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomeColors.white,
      child: TabBar(
        isScrollable: true,
        labelColor: CustomeColors.primary,
        unselectedLabelColor: Colors.black54,
        indicatorColor: CustomeColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(CustomDeviceHelper.getAppBarHeight());
}
