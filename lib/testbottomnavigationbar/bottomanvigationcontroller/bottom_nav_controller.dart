// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BottomNavigationController extends GetxController {
//   var selectedIndex = 0.obs;

//   final List<GlobalKey<NavigatorState>> navigatorKeys = List.generate(
//     5,
//     (index) => GlobalKey<NavigatorState>(),
//   );

//   void changeTab(int index) {
//     selectedIndex.value = index;
//   }

//   Future<bool> onWillPop() async {
//     final NavigatorState currentNavigator =
//         navigatorKeys[selectedIndex.value].currentState!;
//     if (currentNavigator.canPop()) {
//       currentNavigator.pop();
//       return false;
//     }
//     return true;
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Future<bool> onWillPop() async {
    return true; // Optional: Handle back nav if needed
  }
}
