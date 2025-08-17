import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../common/key/database_key.dart';
import '../../../utils/helpers/custom_helper_function.dart';
import '../../../utils/utils.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;

  var isLoading = false.obs;

  /// Upload product images (all + thumbnail + variation images) & save product to Firestore
  /* Future<void> uploadProducts(List<ProductModel> products) async {
    isLoading.value = true;

    try {
      for (var product in products) {
        List<String> uploadedImageUrls = [];

        // 🖼️ CASE 1: Upload product images (if available)
        if (product.images != null && product.images!.isNotEmpty) {
          for (String imgPath in product.images!) {
            File imageFile = await CustomHelperFunction.assetToFile(imgPath);
            String extension = imageFile.path.split('.').last;

            String? uploadedUrl = await Utils.uploadFileToFirebaseStorage(
              imageFile.path,
              DatabaseKey.productsFolder,
              extension,
            );

            if (uploadedUrl != null) {
              uploadedImageUrls.add(uploadedUrl);
            }
          }

          // Update product variation images (if matched with original image path)
          if (product.productVariations != null &&
              product.productVariations!.isNotEmpty) {
            for (final variation in product.productVariations!) {
              int index = product.images!.indexWhere(
                (element) => element == variation.image,
              );

              if (index != -1 && index < uploadedImageUrls.length) {
                variation.image = uploadedImageUrls[index];
              }
            }
          }
        } else {
          print("ℹ️ No product images found for: ${product.title}");
        }

        // 🖼️ CASE 2: Upload thumbnail separately (if it exists locally)
        if (product.thumbnail.isNotEmpty &&
            !product.thumbnail.startsWith("http")) {
          File thumbFile = await CustomHelperFunction.assetToFile(
            product.thumbnail,
          );
          String ext = thumbFile.path.split('.').last;

          String? thumbUrl = await Utils.uploadFileToFirebaseStorage(
            thumbFile.path,
            DatabaseKey.productsFolder,
            ext,
          );

          if (thumbUrl != null) {
            product.thumbnail = thumbUrl;
          }
        } else {
          if (product.thumbnail.isEmpty && uploadedImageUrls.isNotEmpty) {
            // If no thumbnail, set first uploaded image as thumbnail
            product.thumbnail = uploadedImageUrls.first;
          }
        }

        // Update product images with uploaded URLs
        if (uploadedImageUrls.isNotEmpty) {
          product.images = uploadedImageUrls;
        }

        // 📝 Save product to Firestore
        await _db
            .collection(DatabaseKey.productsCollection)
            .doc(product.id)
            .set(product.toJson());

        print("✅ Product uploaded: ${product.title}");
      }
    } catch (e) {
      Utils.showToast("❌ Error uploading products: $e");
    } finally {
      isLoading.value = false;
    }
  }

 */

  Future<void> uploadProducts(List<ProductModel> products) async {
    isLoading.value = true;

    try {
      for (var product in products) {
        Map<String, String> uploadedUrlMap = {}; // local path -> uploaded URL

        // -----------------------------
        // 1️⃣ Upload product images
        // -----------------------------
        if (product.images != null && product.images!.isNotEmpty) {
          for (String imgPath in product.images!) {
            if (imgPath.startsWith("http")) {
              uploadedUrlMap[imgPath] = imgPath;
              continue;
            }

            File imageFile = await CustomHelperFunction.assetToFile(imgPath);
            String extension = imageFile.path.split('.').last;

            String? uploadedUrl = await Utils.uploadFileToFirebaseStorage(
              imageFile.path,
              DatabaseKey.productsFolder,
              extension,
            );

            if (uploadedUrl != null) {
              uploadedUrlMap[imgPath] = uploadedUrl;
            }
          }
        }

        // -----------------------------
        // 2️⃣ Upload thumbnail
        // -----------------------------
        if (product.thumbnail.isNotEmpty &&
            !product.thumbnail.startsWith("http")) {
          File thumbFile = await CustomHelperFunction.assetToFile(
            product.thumbnail,
          );
          String ext = thumbFile.path.split('.').last;

          String? thumbUrl = await Utils.uploadFileToFirebaseStorage(
            thumbFile.path,
            DatabaseKey.productsFolder,
            ext,
          );

          if (thumbUrl != null) {
            uploadedUrlMap[product.thumbnail] = thumbUrl;
            product.thumbnail = thumbUrl;
          }
        } else if (product.thumbnail.isEmpty &&
            product.images != null &&
            product.images!.isNotEmpty) {
          // If no thumbnail, set first uploaded image as thumbnail
          product.thumbnail = uploadedUrlMap[product.images!.first] ?? '';
        }

        // -----------------------------
        // 3️⃣ Replace product images with uploaded URLs
        // -----------------------------
        if (product.images != null && product.images!.isNotEmpty) {
          product.images =
              product.images!.map((img) => uploadedUrlMap[img] ?? img).toList();
        }

        // -----------------------------
        // 4️⃣ Update variation images
        // -----------------------------
        if (product.productVariations != null &&
            product.productVariations!.isNotEmpty) {
          for (var variation in product.productVariations!) {
            // Skip if already a URL
            if (variation.image.startsWith("http")) continue;

            // Check if variation image matches any uploaded product image
            if (uploadedUrlMap.containsKey(variation.image)) {
              variation.image = uploadedUrlMap[variation.image]!;
            }
            // Check if variation image matches the thumbnail
            else if (variation.image == product.thumbnail) {
              variation.image = product.thumbnail;
            }
            // Otherwise, if local asset not uploaded, skip
          }
        }

        // -----------------------------
        // 5️⃣ Save product to Firestore
        // -----------------------------
        await _db
            .collection(DatabaseKey.productsCollection)
            .doc(product.id)
            .set(product.toJson());

        print("✅ Product uploaded: ${product.title}");
      }
    } catch (e) {
      Utils.showToast("❌ Error uploading products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch all featured products
  Future<List<ProductModel>> getFeatureProducts() async {
    final List<ProductModel> productList = [];

    try {
      isLoading.value = true;

      final querySnapshot =
          await _db
              .collection(DatabaseKey.productsCollection)
              .where("isFeatured", isEqualTo: true)
              .limit(6)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        productList.addAll(
          querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)),
        );
      } else {
        debugPrint("ℹ️ No featured products found in Firestore");
      }
    } catch (e, stackTrace) {
      Utils.showToast("❌ Error fetching featured products");
      debugPrint("🔥 Firestore error: $e");
      debugPrint("📌 StackTrace: $stackTrace");
    } finally {
      isLoading.value = false;
    }

    return productList;
  }

  Future<List<ProductModel>> getProductsFroBrand({
    required String brandId,
    int limit = -1,
  }) async {
    final List<ProductModel> productBrandList = [];

    try {
      isLoading.value = true;

      final querySnapshot =
          limit == -1
              ? await _db
                  .collection(DatabaseKey.productsCollection)
                  .where("brand.id", isEqualTo: brandId)
                  .get()
              : await _db
                  .collection(DatabaseKey.productsCollection)
                  .where("brand.id", isEqualTo: brandId)
                  .limit(limit)
                  .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          productBrandList.add(ProductModel.fromSnapshot(doc));
        }
        // productBrandList.addAll(
        //   querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)),
        // );
      } else {
        debugPrint("ℹ️ No featured products found in Firestore");
      }
    } catch (e, stackTrace) {
      Utils.showToast("❌ Error fetching featured products");
      debugPrint("🔥 Firestore error: $e");
      debugPrint("📌 StackTrace: $stackTrace");
    } finally {
      isLoading.value = false;
    }
    return productBrandList;
  }

  /// Fetch all featured products
  Future<List<ProductModel>> showAllFeaturedProducts() async {
    final List<ProductModel> allProductList = [];

    try {
      isLoading.value = true;

      final querySnapshot =
          await _db
              .collection(DatabaseKey.productsCollection)
              .where("isFeatured", isEqualTo: true)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        allProductList.addAll(
          querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)),
        );
      } else {
        debugPrint("ℹ️ No featured products found in Firestore");
      }
    } catch (e, stackTrace) {
      Utils.showToast("❌ Error fetching featured products");
      debugPrint("🔥 Firestore error: $e");
      debugPrint("📌 StackTrace: $stackTrace");
    } finally {
      isLoading.value = false;
    }

    return allProductList;
  }

  Future<List<ProductModel>> fetchAllProductByQuery(Query query) async {
    final List<ProductModel> allProductList = [];

    try {
      final querySnapshot = await query.get();

      if (querySnapshot.docs.isNotEmpty) {
        allProductList.addAll(
          querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)),
        );
      } else {
        debugPrint("ℹ️ No featured products found in Firestore");
      }
    } catch (e, stackTrace) {
      Utils.showToast("❌ Error fetching featured products");
      debugPrint("🔥 Firestore error: $e");
      debugPrint("📌 StackTrace: $stackTrace");
    }

    return allProductList;
  }
}
