import 'dart:convert';

import 'package:ecommerceappwithfirebase/data/repositories/product/producr_repository.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repositories/authentications_repo.dart';

class FavouriteController extends GetxController {
  final authController = Get.put(AuthenticationsRepoController());
  RxMap<String, bool> favourites = <String, bool>{}.obs;
  final productRepo = Get.put(ProductRepository());
  late final GetStorage _storage;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    _storage = GetStorage(authController.currentUser!.uid);
    initFavourites();
  }

  /// Initialize favourites from local storage
  Future<void> initFavourites() async {
    final storedFavourites = _storage.read('favourites');
    if (storedFavourites != null) {
      try {
        final Map<String, dynamic> decoded =
            jsonDecode(storedFavourites) as Map<String, dynamic>;

        favourites.assignAll(
          decoded.map((key, value) => MapEntry(key, value as bool)),
        );
      } catch (e) {
        debugPrint("⚠️ Error decoding favourites: $e");
      }
    }
  }

  /// Add/remove product from favourites
  void toggleFavouriteProduct(String productId) {
    if (favourites.containsKey(productId)) {
      favourites.remove(productId);
      Utils.showToast("❌ Product removed from wishlist");
    } else {
      favourites[productId] = true;
      Utils.showToast("✅ Product added to wishlist");
    }
    saveFavouritesToStorage();
  }

  /// Save favourites into local storage
  void saveFavouritesToStorage() {
    final encoded = jsonEncode(favourites);
    _storage.write("favourites", encoded);
  }

  /// Check if product is favourite
  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  /// Fetch favourite products from Firestore
  Future<List<ProductModel>> getFavouritesProducts() async {
    isLoading.value = true;
    try {
      final productIds = favourites.keys.toList();
      if (productIds.isEmpty) return [];
      return await productRepo.getFavouritesProducts(productIds);
    } catch (e) {
      Utils.showToast("❌ Error fetching wishlist: $e");
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
