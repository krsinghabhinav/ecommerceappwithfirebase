import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:get/get.dart';
import '../../data/repositories/product/producr_repository.dart';
import '../../model/product_model.dart';

class AllproductController extends GetxController {
  final productRepo = Get.put(ProductRepository());

  // ✅ Fetch products safely
  Future<List<ProductModel>> fetchAllProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final List<ProductModel> productData = await productRepo
          .fetchAllProductByQuery(query);
      print("✅ Product Data: ${productData.length} items fetched");

      return productData;
    } catch (e) {
      Utils.showToast("❌ Error fetching products: $e");
      return [];
    }
  }
}
