import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottomanvigationcontroller/bottom_nav_controller.dart';
import '../tabs/shortvideo_tab.dart';
import '../tabs/home_tab.dart';

class MainPage extends StatelessWidget {
  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: controller.onWillPop,
        child: Scaffold(
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _buildPage(controller.selectedIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow_rounded),
                label: "Shorts",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions),
                label: "Subscriptions",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: "Library",
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Lazily loads screens
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeTab();
      case 1:
        return ShortVedioScreen();
      case 2:
        return Center(
          key: const ValueKey('add'),
          child: Text("Add", style: TextStyle(color: Colors.white)),
        );
      case 3:
        return Center(
          key: const ValueKey('subscriptions'),
          child: Text("Subscriptions", style: TextStyle(color: Colors.white)),
        );
      case 4:
        return Center(
          key: const ValueKey('library'),
          child: Text("Library", style: TextStyle(color: Colors.white)),
        );
      default:
        return HomeTab();
    }
  }
}
