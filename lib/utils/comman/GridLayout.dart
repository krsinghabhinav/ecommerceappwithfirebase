import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
    super.key,
    required this.mainAxisExtent,
    required this.itemBuilder,
    required this.itemCout,
  });

  final double mainAxisExtent;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCout;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCout,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        mainAxisExtent: mainAxisExtent ?? Get.height * 0.32,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
