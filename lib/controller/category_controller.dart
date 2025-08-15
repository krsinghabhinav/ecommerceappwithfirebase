import 'package:ecommerceappwithfirebase/data/repositories/category/category_respositry.dart';
import 'package:ecommerceappwithfirebase/utils/utils.dart';
import 'package:get/get.dart';
import '../model/category_model.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;

  final categoryRespositry = Get.put(CategoryRespositry());
  RxList<CategoryModel> categoriesList = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    categoriesData();
    super.onInit();
  }

  Future<void> categoriesData() async {
    try {
      isLoading.value = true;

      // Clear previous data before fetching
      categoriesList.clear();
      featuredCategories.clear();

      // Fetch fresh data
      List<CategoryModel> categories =
          await categoryRespositry.getAllCategories();

      // Add categories one by one
      for (int i = 0; i < categories.length; i++) {
        categoriesList.add(categories[i]);

        // Check if featured
        if (categories[i].isFeatured == true &&
            categories[i].parentId.isEmpty) {
          featuredCategories.add(categories[i]);
        }
        print("lenth of categories====> ${categories.length}");
      }
    } catch (e) {
      Utils.showToast("❌ Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
