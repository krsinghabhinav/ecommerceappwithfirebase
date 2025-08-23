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
  RxList<BrandModel> brandListcategories = <BrandModel>[].obs;
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
  Future<List<ProductModel>> getBrandProduct(String brandId, {int limit = -1}) async {
    try {
      final products = await productRepository.getProductsFroBrand(
        brandId: brandId,
        limit: limit,
      );
      brandProductList.assignAll(products); // updates observable list
      print("✅ Products fetched for Brand $brandId : ${products.length}");
      return products; // ✅ return the products properly
    } catch (e) {
      Utils.showToast("❌ Error while fetching products: $e");
      return []; // return empty list if error
    } finally {}
  }

  @override
  void onInit() {
    getBrandData();
    super.onInit();
  }

  // get brans for spacific categories

  // Future<List<BrandModel>?> getBrandForCategory(String categoryId) async {
  //   try {
  //     final brand = await brandRepo.frtchBrandForCategories(categoryId);
  //     if (brand != null) {
  //       brandListcategories.assignAll(brand);
  //     } else {
  //       brandListcategories.clear();
  //     }
  //   } catch (e) {
  //     Utils.showToast("❌ Error while fetching brand:categories $e");
  //     brandListcategories.clear();
  //   }
  // }

  Future<void> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepo.frtchBrandForCategories(categoryId);

      // Pehle clear kar do
      brandListcategories.clear();

      if (brands != null) {
        for (int i = 0; i < brands.length; i++) {
          final brand = brands[i];

          if (brand.id.isNotEmpty) {
            // Agar brand ka id valid hai to add karo
            brandListcategories.add(brand);
          } else if (brand.id.isEmpty) {
            // Agar id empty hai to skip kar do
            continue;
          }
        }
      } else if (brands == null) {
        // Agar pura list null mila
        brandListcategories.clear();
      }
    } catch (e) {
      Utils.showToast("❌ Error while fetching brand:categories $e");
      brandListcategories.clear();
    }
  }
}
