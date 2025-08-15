import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/common/key/database_key.dart';
import 'package:ecommerceappwithfirebase/features/shopping/model/category_model.dart';
import 'package:ecommerceappwithfirebase/utils/helpers/custom_helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/helpers/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/utils.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class CategoryRespositry extends GetxController {
  static CategoryRespositry get instance => Get.find();
  final storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;
  CloudinaryServices cloudinaryService = Get.put(CloudinaryServices());

  // upload image using cloudinary database only upload image url to firebase to link with firebase document
  //   Future<void> uploadCategories(List<CategoryModel> categories) async {
  //     try {
  //       for (var category in categories) {
  //         File imageFile = await CustomHelperFunction.assetToFile(category.image);
  //         dio.Response response = await cloudinaryService.uploadImage(
  //           imageFile,
  //           DatabaseKey.categoryFolder,
  //         );

  //         if (response.statusCode == 200) {
  //           category.image = response.data['url'];
  //         }
  //         await _db
  //             .collection(DatabaseKey.categoryCollection)
  //             .doc(category.id)
  //             .set(category.toJson());

  //         Utils.showToast(" Category uploaded");
  //         print("categories name==> ${category.name}");
  //       }
  //     } on FirebaseException catch (e) {
  //       Utils.showToast(CustomFirebaseAuthException(e.code).message);
  //     } on PlatformException catch (e) {
  //       Utils.showToast(CustomFirebaseAuthException(e.code).message);
  //     } on FormatException {
  //       Utils.showToast("Invalid format");
  //     } catch (e) {
  //       Utils.showToast("Something went wrong. Please try again.");
  //     }
  //   }

  /// Upload file to Firebase Storage
  Future<String?> uploadFileToFirebaseStorageWithCategories(
    String filePath,
    String folder,
    String extension,
  ) async {
    try {
      var uuid = const Uuid();
      String uniqueFileName = "${uuid.v4()}.$extension";
      final path = "$folder/$uniqueFileName";
      final file = File(filePath);
      final ref = storage.ref().child(path);

      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      Utils.showToast("❌ Error uploading file: $e");
      return null;
    }
  }

  /// Upload categories with image to Firebase Firestore and image link to show on the firebasecloud
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      for (var category in categories) {
        // Convert asset to File
        File imageFile = await CustomHelperFunction.assetToFile(category.image);
    
        // Get extension
        String extension = imageFile.path.split('.').last;

        // Upload to Firebase Storage
        String? imageUrl = await uploadFileToFirebaseStorageWithCategories(
          imageFile.path,
          DatabaseKey.categoryFolder,
          extension,
        );

        if (imageUrl != null) {
          category.image = imageUrl;
        }

        // Save to Firestore
        await _db
            .collection(DatabaseKey.categoryCollection)
            .doc(category.id)
            .set(category.toJson());

        Utils.showToast("✅ Category uploaded: ${category.name}");
        print("Category uploaded ==> ${category.name}");
      }
    } catch (e) {
      Utils.showToast("❌ Error uploading categories: $e");
    }
  }
}
