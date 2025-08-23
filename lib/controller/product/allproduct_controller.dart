import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:get/get.dart';
import '../../data/repositories/product/producr_repository.dart';
import '../../model/product_model.dart';

class AllproductController extends GetxController {
  final productRepo = Get.put(ProductRepository());
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

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

  void sortProducts(String sortOption) {
    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "High Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Newest":
        products.sort(
          (a, b) => a.date!.compareTo(b.date!),
        ); // ignore: unnecessary_null_awareness
        break;
      case "Sale":
        products.sort((a, b) {
          if (b.salePrice > 0) {
            // if product has sale price
            return b.salePrice.compareTo(a.salePrice); // descending order
          } else if (a.salePrice > 0) {
            return -1; // Move items with sale price to the top
          } else {
            return 1; // No sale price, so keep original order
          }
        });
        break;
      default:
    }
  }

  void assignProduct(List<ProductModel> product) {
    products.assignAll(product);
    sortProducts("Name");
  }
}
