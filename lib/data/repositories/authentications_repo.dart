import 'package:ecommerceappwithfirebase/common/localstoragetext.dart';
import 'package:ecommerceappwithfirebase/data/repositories/banners/banner_repositry.dart';
import 'package:ecommerceappwithfirebase/data/repositories/category/category_respositry.dart';
import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/email%20screen/verity_eamil_address.dart';
import 'package:ecommerceappwithfirebase/utils/dummy_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../features/authentication/auth screen/login/login_screen.dart';
import '../../features/authentication/auth screen/onboarding/onboarding_screen.dart';
import '../../model/banners_model.dart';
import '../../model/brand_model.dart';
import '../../model/category_model.dart';
import '../../navigation_menubar.dart';
import 'brand/brand_repositry.dart';
import 'product/producr_repository.dart';

class AuthenticationsRepoController extends GetxController {
  final storage = GetStorage();
  final auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;

  @override
  void onReady() {
    screenRedirect();
    // Get.put(CategoryRespositry()).uploadCategories(CustomDummyData.categories);
    /// Upload categories to Firebase Storage + Firestore on app start
    // Get.put(CategoryRespositry()).uploadCategories(CustomDummyData.categories);
    // Get.put(BannerRepository()).uploadBannerImage(CustomDummyData.banner);
    // checkAndUploadCategories();
    // checkAndUploadBanners();
    // // Get.put(BrandRepository()).uploadBrandImage(CustomDummyData.brands);
    // checkAndUploadBrands(); // ✅ fixed
    // Get.put(ProductRepository()).uploadProducts(CustomDummyData.products);
    super.onReady();
  }

  /// ========================= BRANDS =========================
  Future<void> checkAndUploadBrands() async {
    bool alreadyUploaded = storage.read("brandsUploaded") ?? false;
    final repo = Get.put(BrandRepository());

    if (!alreadyUploaded) {
      await repo.uploadBrandImage(CustomDummyData.brands);
      storage.write("brandsUploaded", true);
      print("✅ Brands uploaded first time.");
    } else {
      List<BrandModel> newBrands = await _getNewBrands();
      if (newBrands.isNotEmpty) {
        await repo.uploadBrandImage(newBrands);
        print("✅ Only new brands uploaded: ${newBrands.length}");
      } else {
        print("🚫 No new brands to upload");
      }
    }
  }

  /// Compare dummy brands with Firestore brands → get only new ones
  Future<List<BrandModel>> _getNewBrands() async {
    final repo = Get.put(BrandRepository());
    final firestoreBrands = await repo.getAllBrands();
    List<BrandModel> newList = [];

    for (var dummyBrand in CustomDummyData.brands) {
      bool exists = false;
      for (var firestoreBrand in firestoreBrands) {
        if (dummyBrand.id == firestoreBrand.id) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        newList.add(dummyBrand);
      }
    }
    return newList;
  }

  Future<void> checkAndUploadCategories() async {
    bool alreadyUpload = storage.read("categoriesUploaded") ?? false;

    if (!alreadyUpload) {
      //first time upload
      await Get.put(
        CategoryRespositry(),
      ).uploadCategories(CustomDummyData.categories);
      storage.write("categoriesUploaded", true);
      print("✅ Categories uploaded first time.");
    } else {
      //check if new categories are added
      List<CategoryModel> newCategories = await _getNewCategories();
      if (newCategories.isNotEmpty) {
        await Get.put(CategoryRespositry()).uploadCategories(newCategories);
        print("✅ Only new categories uploaded: ${newCategories.length}");
      } else {
        print("🚫 No new categories to upload");
      }
    }
  }

  Future<List<CategoryModel>> _getNewCategories() async {
    final repo = Get.put(CategoryRespositry());
    final firststoreCategories = await repo.getAllCategories();
    List<CategoryModel> newlist = [];

    for (int i = 0; i < CustomDummyData.categories.length; i++) {
      bool exists = false;

      for (int j = 0; j < firststoreCategories.length; j++) {
        if (CustomDummyData.categories[i].id == firststoreCategories[j].id) {
          exists = true;
          break;
        }
      }

      if (!exists) {
        newlist.add(CustomDummyData.categories[i]);
      }
    }
    return newlist;
  }

  // ========================= BANNERS =========================
  Future<void> checkAndUploadBanners() async {
    bool alreadyUploaded = storage.read("bannersUploaded") ?? false;

    if (!alreadyUploaded) {
      await Get.put(
        BannerRepository(),
      ).uploadBannerImage(CustomDummyData.banner);
      storage.write("bannersUploaded", true);
      print("✅ Banners uploaded first time.");
    } else {
      List<BannerModel> newBanners = await _getNewBanners();
      if (newBanners.isNotEmpty) {
        await Get.put(BannerRepository()).uploadBannerImage(newBanners);
        print("✅ Only new banners uploaded: ${newBanners.length}");
      } else {
        print("🚫 No new banners to upload");
      }
    }
  }

  Future<List<BannerModel>> _getNewBanners() async {
    final repo = Get.put(BannerRepository());
    final firestoreBanners = await repo.getAllBanners();
    List<BannerModel> newList = [];

    for (int i = 0; i < CustomDummyData.banner.length; i++) {
      bool exists = false;

      for (int j = 0; j < firestoreBanners.length; j++) {
        // 🔹 अब ID से compare होगा, जिससे पहली बार के बाद डुप्लीकेट नहीं होंगे
        if (firestoreBanners[j].id == CustomDummyData.banner[i].id) {
          exists = true;
          break;
        }
      }

      if (!exists) {
        newList.add(CustomDummyData.banner[i]);
      }
    }
    return newList;
  }
  // Future<List<BannerModel>> _getNewBanners() async {
  //   final repo = Get.put(BannerRepository());
  //   final firestoreBanners =
  //       await repo
  //           .getAllBanners(); // You'll add this method in BannerRepository
  //   List<BannerModel> newList = [];

  //   for (var dummyBanner in CustomDummyData.banner) {
  //     bool exists = firestoreBanners.any(
  //       (existing) =>
  //           existing.imageUrl == dummyBanner.imageUrl &&
  //           existing.targetScreen == dummyBanner.targetScreen,
  //     );
  //     if (!exists) {
  //       newList.add(dummyBanner);
  //     }
  //   }
  //   return newList;
  // }

  void screenRedirect() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for splash

    // Set default value if not present
    storage.writeIfNull(Localstoragetext.isFirstTime, true);

    final isFirstTime = storage.read(Localstoragetext.isFirstTime);
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenubar());
      } else {
        Get.offAll(() => VerityEamilAddress());
      }
    } else {
      if (isFirstTime == true) {
        Get.offAll(() => OnboardingScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    }
  }
}
