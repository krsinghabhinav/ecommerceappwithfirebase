import 'package:ecommerceappwithfirebase/data/repositories/banners/banner_repositry.dart';
import 'package:ecommerceappwithfirebase/model/banners_model.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';

class BannerControllerd extends GetxController {
  var isLoading = false.obs;
  RxList<BannerModel> bannersList = <BannerModel>[].obs;

  final bannerRepo = Get.put(BannerRepository());

  Future<void> getBanner() async {
    try {
      isLoading.value = true;
      bannersList.clear();
      List<BannerModel> banner = await bannerRepo.getAllBanners();
      bannersList.value = banner;
    } catch (e) {
      Utils.showToast("❌ Error fetching banners: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getBanner();
    super.onInit();
  }
}
