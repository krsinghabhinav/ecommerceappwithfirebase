import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/common/key/database_key.dart';
import 'package:ecommerceappwithfirebase/model/banners_model.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/utils.dart';
import '../../services/cloudinary_services.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;
  final cloudinaryService = Get.put(CloudinaryServices());

  var isLoading = false.obs;

  /// Upload banners to Firebase Storage + Firestore
  Future<void> uploadBannerImage(List<BannerModel> banners) async {
    isLoading.value = true;

    try {
      for (var banner in banners) {
        try {
          // 1️⃣ Convert asset to File
          File imageFile = await CustomHelperFunction.assetToFile(
            banner.imageUrl,
          );

          // 2️⃣ Get extension
          String extension = imageFile.path.split('.').last;

          // 3️⃣ Upload to Firebase Storage
          String? uploadedUrl = await Utils.uploadFileToFirebaseStorage(
            imageFile.path,
            DatabaseKey.bannersFolder,
            extension,
          );

          if (uploadedUrl == null) {
            Utils.showToast(
              "❌ Failed to upload image for ${banner.targetScreen}",
            );
            continue;
          }

          // 4️⃣ Create a new banner instance with updated imageUrl
          final updatedBanner = BannerModel(
            imageUrl: uploadedUrl,
            targetScreen: banner.targetScreen,
            active: banner.active,
          );

          // 5️⃣ Generate a unique document ID
          String docId = const Uuid().v4();

          // 6️⃣ Save to Firestore
          await _db
              .collection(DatabaseKey.bannerCollection)
              .doc(docId)
              .set(updatedBanner.toJson());

          print("✅ Banner uploaded: ${updatedBanner.imageUrl}");
        } catch (err) {
          Utils.showToast("⚠️ Error processing banner: $err");
        }
      }
    } catch (e) {
      Utils.showToast("❌ Error uploading banners: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BannerModel>> getAllBanners() async {
    List<BannerModel> bannerList = [];
    try {
      isLoading.value = true;
      bannerList.clear();
      final query = await _db.collection(DatabaseKey.bannerCollection).get();
      if (query.docs.isNotEmpty) {
        for (int i = 0; i < query.docs.length; i++) {
          final doc = query.docs[i];

          if (doc.exists) {
            BannerModel category = BannerModel.fromDocument(doc);
            bannerList.add(category);
            print("category=====>${category}");
          } else {
            Utils.showToast("⚠️ Document missing at index: $i");
          }
        }
      } else {
        Utils.showToast("📭 No categories found in Firestore");
      }
    } on FirebaseException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on PlatformException catch (e) {
      Utils.showToast(CustomFirebaseAuthException(e.code).message);
    } on FormatException {
      Utils.showToast("Invalid format");
    } catch (e) {
      Utils.showToast("Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
    return bannerList;
  }
}
