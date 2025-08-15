import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

import 'package:ecommerceappwithfirebase/common/key/database_key.dart';
import 'package:ecommerceappwithfirebase/data/apis.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class CloudinaryServices extends GetxController {
  static CloudinaryServices get instace => Get.find();

  final _dio = dio.Dio();

  /// [UploadImage] - Function to upload Image

  Future<dio.Response> uploadImage(File images, String folderName) async {
    try {
      String api = CustomApiUrls.uploadApi(DatabaseKey.cloudName);
      final formData = dio.FormData.fromMap({
        "upload_preset": DatabaseKey.uploadPreset,
        "folder": folderName,
        "file": await dio.MultipartFile.fromFile(
          images.path,
          filename: images.path.split('/').last,
        ),
      });
      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again';
    }
  }

  /// [DeleteImage] - Function to delete Image
  Future<dio.Response> deleteImage(String publicId) async {
    try {
      String api = CustomApiUrls.deleteApi(DatabaseKey.cloudName);

      int timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

      String signatureBase =
          'public_id=$publicId&timestamp=$timestamp${DatabaseKey.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

      final formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': DatabaseKey.apiKey,
        'timestamp': timestamp,
        'signature': signature,
      });

      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
