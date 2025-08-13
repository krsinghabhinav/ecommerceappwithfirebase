import 'package:ecommerceappwithfirebase/features/cart/cart_screen.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/home/homescreen.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shopping/screen/personalization/profile_screen.dart';
import 'features/shopping/screen/store/store_screen.dart';
import 'features/shopping/screen/wishlist/whishlsit_screen.dart';

class NavigationMenubar extends StatefulWidget {
  const NavigationMenubar({super.key});

  @override
  State<NavigationMenubar> createState() => _NavigationMenubarState();
}

class _NavigationMenubarState extends State<NavigationMenubar> {
  NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    bool dark = CustomHelperFunction.isDarkMode(context);
    return Scaffold(
      body: Obx(
        () =>
            navigationController.screens[navigationController
                .selectedIndex
                .value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: dark ? CustomeColors.dark : CustomeColors.light,
          indicatorColor:
              dark
                  ? CustomeColors.light.withValues(alpha: 0.1)
                  : CustomeColors.black.withValues(alpha: 0.1),
          elevation: 0,
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) {
            // navigationController.selectedIndex.value = index;
            navigationController.updateIndex(index);
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            NavigationDestination(icon: Icon(Iconsax.bag), label: "Cart"),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void updateIndex(index) {
    selectedIndex.value = index;
  }

  List<Widget> screens = [
    Homescreen(),
    StoreScreen(),
    WhishlsitScreen(),
    ProfileScreen(),
    CartScreen(),
  ];
}
