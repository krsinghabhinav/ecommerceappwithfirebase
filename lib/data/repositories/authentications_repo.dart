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
import '../../model/category_model.dart';
import '../../navigation_menubar.dart';

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
    Get.put(BannerRepository()).uploadBannerImage(CustomDummyData.banner);
    checkAndUploadCategories();

    super.onReady();
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
    final firestoreBanners =
        await repo
            .getAllBanners(); // You'll add this method in BannerRepository
    List<BannerModel> newList = [];

    for (var dummyBanner in CustomDummyData.banner) {
      bool exists = firestoreBanners.any(
        (existing) =>
            existing.imageUrl == dummyBanner.imageUrl &&
            existing.targetScreen == dummyBanner.targetScreen,
      );
      if (!exists) {
        newList.add(dummyBanner);
      }
    }
    return newList;
  }

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
