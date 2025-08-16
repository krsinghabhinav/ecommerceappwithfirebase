import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/model/brand_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../../common/key/database_key.dart';
import '../../../utils/helpers/custom_helper_function.dart';
import '../../../utils/utils.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;

  var isLoading = false.obs;

  /// Upload brands to Firebase Storage + Firestore
  Future<void> uploadBrandImage(List<BrandModel> brands) async {
    isLoading.value = true;

    try {
      for (var brand in brands) {
        // 1️⃣ Convert asset path to a File
        File imageFile = await CustomHelperFunction.assetToFile(brand.image);

        // 2️⃣ Extract file extension
        String extension = imageFile.path.split('.').last;

        // 3️⃣ Upload to Firebase Storage
        String? brandurl = await Utils.uploadFileToFirebaseStorage(
          imageFile.path,
          DatabaseKey.brandsFolder,
          extension,
        );

        if (brandurl != null) {
          // 4️⃣ Update brand model with the uploaded URL
          brand.image = brandurl;
        }

        // 5️⃣ Save to Firestore (use brand.id as document ID)
        await _db
            .collection(DatabaseKey.brandsCollection)
            .doc(brand.id)
            .set(brand.toJson());

        print("✅ Brand uploaded: ${brand.name}");
      }
    } catch (e) {
      Utils.showToast("❌ Error uploading brands: $e");
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
