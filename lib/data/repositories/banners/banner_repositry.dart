// 📂 banner_repository.dart
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

  /// Upload banners
  Future<void> uploadBannerImage(List<BannerModel> banners) async {
    isLoading.value = true;

    try {
      for (var banner in banners) {
        try {
          File imageFile = await CustomHelperFunction.assetToFile(
            banner.imageUrl,
          );

          String extension = imageFile.path.split('.').last;

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

          banner.imageUrl = uploadedUrl;

          // 🔹 Firestore में ID वही use करें जो BannerModel में है
          await _db
              .collection(DatabaseKey.bannerCollection)
              .doc(banner.id)
              .set(banner.toJson());

          print("✅ Banner uploaded: ${banner.imageUrl}");
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
      final query =
          await _db
              .collection(DatabaseKey.bannerCollection)
              .where("active", isEqualTo: true)
              .get();
      for (var doc in query.docs) {
        bannerList.add(BannerModel.fromDocument(doc));
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
