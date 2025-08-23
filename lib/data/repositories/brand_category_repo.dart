import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/model/brand_category_model.dart';
import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:ecommerceappwithfirebase/model/product_category_model.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/key/database_key.dart';
import '../../../utils/helpers/custom_helper_function.dart';
import '../../../utils/utils.dart';
import '../../utils/helpers/exceptions/firebase_auth_exceptions.dart';

class BrandCategoryRepo extends GetxController {
  static BrandCategoryRepo get instance => Get.find();

  final storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;

  var isLoading = false.obs;

  // /// Upload brands to Firebase Storage + Firestore
  // Future<void> uploadBrandImage(List<BrandCategoryModel> brandCategories) async {
  //   isLoading.value = true;

  //   try {
  //     for (var brandCat in brandCategories) {
  //       // 1️⃣ Convert asset path to a File
  //       File imageFile = await CustomHelperFunction.assetToFile(brandCat.);

  //       // 2️⃣ Extract file extension
  //       String extension = imageFile.path.split('.').last;

  //       // 3️⃣ Upload to Firebase Storage
  //       String? brandurl = await Utils.uploadFileToFirebaseStorage(
  //         imageFile.path,
  //         DatabaseKey.brandsFolder,
  //         extension,
  //       );

  //       if (brandurl != null) {
  //         // 4️⃣ Update brand model with the uploaded URL
  //         brand.image = brandurl;
  //       }

  //       // 5️⃣ Save to Firestore (use brand.id as document ID)
  //       await _db
  //           .collection(DatabaseKey.brandsCollection)
  //           .doc(brand.id)
  //           .set(brand.toJson());

  //       print("✅ Brand uploaded: ${brand.name}");
  //     }
  //   } catch (e) {
  //     Utils.showToast("❌ Error uploading brands: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  Future<void> uploadBrandCategories(
    List<BrandCategoryModel> brandCategories,
  ) async {
    isLoading.value = true;

    try {
      // Loop through all categories
      for (int i = 0; i < brandCategories.length; i++) {
        await _db
            .collection(DatabaseKey.brandCategoryCollection)
            .doc() // Document ID
            .set(brandCategories[i].toJson()); // Save JSON data
      }
      Utils.showToast("Brand Category upload successfully");
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (e) {
      Utils.showToast("Unexpected error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadProductCategories(
    List<ProductCategoryModel> productCategory,
  ) async {
    isLoading.value = true;

    try {
      // Loop through all categories
      for (int i = 0; i < productCategory.length; i++) {
        await _db
            .collection(DatabaseKey.productCategoryCollection)
            .doc() // Document ID
            .set(productCategory[i].toJson()); // Save JSON data
      }
      Utils.showToast("Product Category upload successfully");
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (e) {
      Utils.showToast("Unexpected error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BrandModel>> getAllBrands() async {
    List<BrandModel> brandList = [];
    try {
      isLoading.value = true;
      final query = await _db.collection(DatabaseKey.brandsCollection).get();
      for (var doc in query.docs) {
        brandList.add(BrandModel.fromSnapshot(doc));
      }
    } catch (e) {
      Utils.showToast("❌ Error fetching brands: $e");
    } finally {
      isLoading.value = false;
    }
    return brandList;
  }
}
