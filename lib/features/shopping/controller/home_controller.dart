import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  PageController pageController = PageController();
  CarouselSliderController carouselController = CarouselSliderController();
  void updateIndex(value) {
    selectedIndex.value = value;
  }
}
