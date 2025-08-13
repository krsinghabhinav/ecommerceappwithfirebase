import 'package:flutter/material.dart';

import '../../../../../utils/constants/custome_sizes.dart';
import '../../home/widgets/home_Screen_appbar.dart';
import '../../home/widgets/primaryheadercontainer.dart';

class CustomePrimaryStoreHeader extends StatelessWidget {
  const CustomePrimaryStoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomePrimaryHeaderContainer(
      height: CustomeSizes.storePrimaryHeaderHeight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: HomeScreenAppBar(
          title: "Store",
          fontSize: 24, // Increased font size
          // fontWeight: FontWeight.bold,
          // color: CustomeColors.white,
        ),
      ),
    );
  }
}
