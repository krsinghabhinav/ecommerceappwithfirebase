import 'package:ecommerceappwithfirebase/controller/brands_controllers.dart';
import 'package:ecommerceappwithfirebase/features/shopping/screen/store/widgets/customBrandCard.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/brand_model.dart';
import '../../utils/comman/CustomSortableProducts.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';

class BrandProducrScreen extends StatefulWidget {
  final BrandModel brandModel;
  final String title;

  const BrandProducrScreen({
    super.key,
    required this.brandModel,
    required this.title,
  });

  @override
  State<BrandProducrScreen> createState() => _BrandProducrScreenState();
}

class _BrandProducrScreenState extends State<BrandProducrScreen> {
  late final BrandsControllers brandController;

  @override
  void initState() {
    super.initState();
    brandController = Get.put(BrandsControllers(), permanent: false);

    /// ✅ Fetch products once when screen opens
    Future.microtask(() {
      brandController.getBrandProduct(widget.brandModel.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          widget.title,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Brand Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: customBrandCard(
                width: double.infinity,
                brandModel: widget.brandModel,
              ),
            ),
            const SizedBox(height: 20),

            /// ✅ Products List (Obx instead of FutureBuilder)
            Obx(() {
              if (brandController.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (brandController.brandProductList.isEmpty) {
                return const Center(child: Text("🚫 No products found"));
              }

              return CustomSortableProducts(
                products: brandController.brandProductList,
              );
            }),
          ],
        ),
      ),
    );
  }
}
