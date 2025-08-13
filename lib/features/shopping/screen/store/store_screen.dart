import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/comman/custom_search_bar.dart';
import '../../../../utils/comman/custom_section_heading_text.dart';
import '../../../../utils/utils.dart';
import '../../../brands/brands_screen.dart';
import '../home/widgets/CustomCategoryTab.dart';
import 'widgets/CustomTabBar.dart';
import 'widgets/CustomePrimaryStoreHeader.dart';
import 'widgets/customBrandCard.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                expandedHeight: Get.height * 0.38,
                backgroundColor: Colors.transparent,

                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CustomePrimaryStoreHeader(),
                          CustomSearchbar(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomeSectionHeadingText(
                          title: "Brand",
                          buttonTitle: "View all",
                          onPressed: () {
                            Get.to(() => BrandsScreen());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return customBrandCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                bottom: CustomTabBar(
                  tabs: [
                    Tab(child: Utils.customText("Electronic")),
                    Tab(child: Utils.customText("Fashion")),
                    Tab(child: Utils.customText("Electronic")),
                    Tab(child: Utils.customText("Fashion")),
                    Tab(child: Utils.customText("Books")),
                    Tab(child: Utils.customText("Fashion")),
                    Tab(child: Utils.customText("Electronic")),
                    Tab(child: Utils.customText("Books")),
                    Tab(child: Utils.customText("Fashion")),
                    Tab(child: Utils.customText("Fashion")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
