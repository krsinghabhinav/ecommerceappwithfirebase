// import 'package:ecommerceappwithfirebase/model/product_model.dart';
// import 'package:ecommerceappwithfirebase/model/product_variation_model.dart';
// import 'package:get/get.dart';

// import 'product_image_controller.dart';

// class ProductVariationController extends GetxController {
//   /// User ke selected attributes store honge is map me
//   /// Example: { "Color": "Red", "Size": "M" }
//   RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
//   ProductImageController productImageController = Get.put(
//     ProductImageController(),
//   );
//   RxString variationStockStatus = ''.obs;
//   Rx<ProductVariationModel> selectedVairation =
//       ProductVariationModel.empty().obs;

//   void onAttributeSelected(
//     ProductModel productModel,
//     attributeName,
//     attributeValue,
//   ) {
//     // ✅ Step 1: Existing attributes ko ek naye Map me copy karna
//     Map<String, dynamic> seletcAtrtibutes = Map<String, dynamic>.from(
//       selectedAttributes,
//     );

//     // ✅ Step 2: User ka naya selection update karna
//     // Example: { "Color": "Red" }
//     seletcAtrtibutes[attributeName] = attributeValue;

//     // ✅ Step 3: Observable Map me update karna
//     selectedAttributes[attributeName] = attributeValue;

//     // ✅ Step 4: Ab product ke variations me se wo variation dhoondna
//     // jo user ke selectedAttributes se match kare
//     ProductVariationModel selectVariation = productModel.productVariations!
//         .firstWhere(
//           (variation) => isSameAttributeValues(
//             variation.attributeValues,
//             selectedAttributes,
//           ),
//         );

//     /// Example:
//     /// productVariations = [
//     ///   { "Color": "Red", "Size": "M" },
//     ///   { "Color": "Green", "Size": "L" }
//     /// ]
//     ///
//     /// Agar user ne { "Color": "Red", "Size": "M" } select kiya hai
//     /// to selectedVariation wahi variation hoga
//     ///
//     if (selectVariation.image.isNotEmpty) {
//       productImageController.selectedproductImage.value = selectVariation.image;
//     }

//     selectedVairation.value = selectVariation;
//     getProductVariationStock();
//   }

//   /// Ye function check karega ki variation ka attributes
//   /// user ke selectedAttributes ke sath match karte hain ya nahi
//   bool isSameAttributeValues(
//     Map<String, dynamic> variationAttributes,
//     Map<String, dynamic> selectedAttribute,
//   ) {
//     // ⚠️ Tumhari code me yaha ek choti si bug hai:
//     // Tum "selectedAttributes.length" use kar rahe ho instead of parameter "selectedAttribute.length"
//     // Isse kabhi kabhi galat result aa sakta hai.

//     // ✅ Corrected version
//     if (variationAttributes.length != selectedAttribute.length) return false;

//     // ✅ Har key ka value match karna
//     for (final key in variationAttributes.keys) {
//       // ⚠️ Tumne yaha likha tha:
//       // if (variationAttributes[key] != variationAttributes[key]) return false;
//       // Ye hamesha false return karega, kyunki key apne aap se hi compare ho raha tha 😅

//       // ✅ Correct version
//       if (variationAttributes[key] != selectedAttribute[key]) return false;
//     }
//     return true;
//   }

//   void getProductVariationStock() {
//     // Ye function product variation ke stock ko check karega

//     variationStockStatus.value =
//         selectedVairation.value.stock > 0 ? "In Stock" : "Out of Stock";
//   }
// }
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/model/product_variation_model.dart';
import 'package:ecommerceappwithfirebase/utils/constants/custom_text.dart';
import 'package:get/get.dart';

import 'product_image_controller.dart';

class ProductVariationController extends GetxController {
  /// 🔹 User ke selected attributes store karne ke liye observable Map
  /// Example: { "Color": "Red", "Size": "M" }
  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;

  /// 🔹 Product images ke liye ek aur controller inject kar rahe hain
  ProductImageController productImageController = Get.put(
    ProductImageController(),
  );

  /// 🔹 Variation ka stock status store karne ke liye observable string
  /// Example: "In Stock" ya "Out of Stock"
  RxString variationStockStatus = ''.obs;

  /// 🔹 Currently selected variation store karne ke liye observable
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// 🔹 Ye function tab call hoga jab user koi attribute select karega
  void onAttributeSelected(
    ProductModel productModel,
    String attributeName,
    dynamic attributeValue,
  ) {
    // ✅ Step 1: Pehle existing attributes ka ek copy banao
    Map<String, dynamic> tempAttributes = Map<String, dynamic>.from(
      selectedAttributes,
    );

    // ✅ Step 2: User ka naya selection update karo
    tempAttributes[attributeName] = attributeValue;

    // ✅ Step 3: Observable map ko update karo
    selectedAttributes[attributeName] = attributeValue;

    // ✅ Step 4: Product ke variation list me se matching variation dhoondo
    ProductVariationModel matchedVariation = productModel.productVariations!
        .firstWhere(
          (variation) => isSameAttributeValues(
            variation.attributeValues,
            selectedAttributes,
          ),
          orElse: () => ProductVariationModel.empty(),
        );

    // ✅ Step 5: Agar variation ka image hai to usse ProductImageController me update karo
    if (matchedVariation.image.isNotEmpty) {
      productImageController.selectedproductImage.value =
          matchedVariation.image;
    }

    // ✅ Step 6: Selected variation ko update karo
    selectedVariation.value = matchedVariation;

    // ✅ Step 7: Stock status update karo
    getProductVariationStock();
  }

  /// 🔹 Ye function check karega ki variation ke attributes
  /// aur user ke selected attributes same hain ya nahi
  bool isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttribute,
  ) {
    // Agar dono attributes ka length alag hai to match nahi kar sakte
    if (variationAttributes.length != selectedAttribute.length) return false;

    // Har key ka value match karna
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttribute[key]) return false;
    }
    return true;
  }

  /// 🔹 Ye function check karega ki selected variation ka stock available hai ya nahi
  void getProductVariationStock() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  /// 🔹 Ye function batayega ki ek particular attribute ke kaunse values
  /// available hain (aur jinka stock > 0 hai).
  ///
  /// Example:
  /// Agar productVariations me ye data ho:
  ///   - { "Color": "Red", "Size": "M", stock: 10 }
  ///   - { "Color": "Red", "Size": "L", stock: 0 }
  ///   - { "Color": "Green", "Size": "M", stock: 5 }
  ///
  /// getAttributeAvailabelityInVariation(variations, "Color")
  /// return karega: { "Red", "Green" } (kyunki dono ke stock > 0 hain)
  Set<String> getAttributeAvailabelityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    // ✅ Har variation me check karte hain ki:
    // 1. attribute exist karta hai
    // 2. attribute value empty nahi hai
    // 3. stock > 0 hai
    final availableAttributeValues =
        variations
            .where(
              (variation) =>
                  variation.attributeValues.containsKey(attributeName) &&
                  variation.attributeValues[attributeName] != null &&
                  variation.attributeValues[attributeName]
                      .toString()
                      .isNotEmpty &&
                  variation.stock > 0,
            )
            .map(
              (variation) =>
                  variation.attributeValues[attributeName].toString(),
            )
            .toSet();

    return availableAttributeValues;
  }

  String getVariationPrice() {
    double priceToShow =
        selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price;

    // double ko fix karke string banaya
    return "${CustomText.currency}${priceToShow.toStringAsFixed(0)}";
  }
}
