import 'package:ecommerceappwithfirebase/data/repositories/brand/brand_repositry.dart';
import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class BrandsControllers extends GetxController {
  var isLoading = false.obs;
  final brandRepo = Get.put(BrandRepository());
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<BrandModel> featuerList = <BrandModel>[].obs;

  Future<void> getBrandData() async {
    try {
      isLoading.value = true;

      final brands = await brandRepo.getAllBrands();
      for (int i = 0; i < brands.length; i++) {
        brandList.add(brands[i]);
        if (brands[i].isFeatured == true) {
          featuerList.add(brands[i]);
        }
      }
      print("lenth of brands====> ${brands.length}");
    } catch (e) {
      Utils.showToast("❌ Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getBrandData();
    super.onInit();
  }
}
