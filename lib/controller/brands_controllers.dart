import 'package:ecommerceappwithfirebase/controller/product/product_controller.dart';
import 'package:ecommerceappwithfirebase/data/repositories/brand/brand_repositry.dart';
import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:get/get.dart';

import '../data/repositories/product/producr_repository.dart';
import '../utils/utils.dart';

class BrandsControllers extends GetxController {
  var isLoading = false.obs;
  final brandRepo = Get.put(BrandRepository());
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<BrandModel> featuerList = <BrandModel>[].obs;
  RxList<ProductModel> brandProductList = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

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

  /// Fetch Products of a Brand
  Future<List<ProductModel>> getBrandProduct(String brandId) async {
    try {
      isLoading.value = true;
      final products = await productRepository.getProductsFroBrand(
        brandId: brandId,
      );
      brandProductList.assignAll(products); // updates observable list
      print("✅ Products fetched for Brand $brandId : ${products.length}");
      return products; // ✅ return the products properly
    } catch (e) {
      Utils.showToast("❌ Error while fetching products: $e");
      return []; // return empty list if error
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
