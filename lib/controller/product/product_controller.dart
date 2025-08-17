import 'package:ecommerceappwithfirebase/data/repositories/product/producr_repository.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  RxList<ProductModel> productFeatureList = <ProductModel>[].obs;
  RxList<ProductModel> allFeatureProductList = <ProductModel>[].obs;
  RxDouble percentage = 0.0.obs;
  ProductRepository productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    getProductData(); // automatically fetch when controller initializes
  }

  Future<void> getProductData() async {
    isLoading.value = true;
    try {
      productFeatureList.clear();
      final productData = await productRepo.getFeatureProducts();
      productFeatureList.assignAll(productData); // safer than .value
      print(" Product Data: $productData");
    } catch (e) {
      print("❌ Error in getProductData: $e");
    } finally {
      isLoading.value = false; // always reset
    }
  }

  String? calculateSalePrecentage(double originalPrice, double? salePrice) {
    percentage.value = 0.0;
    if (salePrice == null || salePrice <= 0.0) return "0";
    if (originalPrice <= 0.0) return "0"; // avoid division by zero

    percentage.value = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.value.toStringAsFixed(0); // round to nearest integer
  }

  String getDisplayPrice(ProductModel product) {
    double smallestprice = double.infinity;
    double largestprice = 0;

    // Agar variation nahi hai (single product case)
    if (product.productType == "ProductType.single") {
      return product.salePrice > 0
          ? "${CustomText.currency}${product.salePrice.toStringAsFixed(0)}"
          : "${CustomText.currency}${product.price.toStringAsFixed(0)}";
    } else {
      // Agar variations hain to smallest & largest nikalna hai
      for (final variation in product.productVariations!) {
        double variationPrice =
            variation.salePrice > 0 ? variation.salePrice : variation.price;

        // largest price update
        if (variationPrice > largestprice) {
          largestprice = variationPrice;
        }

        // smallest price update
        if (variationPrice < smallestprice) {
          smallestprice = variationPrice;
        }
      }

      // Agar dono equal hain to ek hi price dikhayenge
      if (smallestprice == largestprice) {
        return "${CustomText.currency}${largestprice.toStringAsFixed(0)}";
      } else {
        return "${CustomText.currency}${smallestprice.toStringAsFixed(0)}-${CustomText.currency}${largestprice.toStringAsFixed(0)}";
      }
    }
  }

  String getProductStatusStock(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }

  Future<List<ProductModel>> getAllFeatureProduct() async {
  

    try {
      // Call repo method to fetch products
      final List<ProductModel> productData =
          await productRepo.showAllFeaturedProducts();

      // Debug log
      print("✅ Product Data: ${productData.length} items fetched");

      return productData;
    } catch (e, stackTrace) {
      // Log both error and stack trace for debugging
      print("❌ Error in getAllFeatureProduct: $e");
      print(stackTrace);
      return [];
    } 
  }
}
