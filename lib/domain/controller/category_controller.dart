import 'package:get/get.dart';
import 'package:mystore/common/loaders/loaders.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/domain/repositories/categories/category_repository.dart';
import 'package:mystore/domain/repositories/products/product_repository.dart';

import '../entities/category/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
   RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
   final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      // Start loading
      isLoading.value = true;
      //FullScreenLoader.openLoadingDialog("Processing..", AppImages.productImage1);

      // Fetch categories from data source (Firebase)
      final categories = await _categoryRepository.getAllCategories();


      // Update the categories list
      allCategories.assignAll(categories);


      //Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally{
      // remove loader

      isLoading.value = false;
    }
  }


  /// Load selected category data




  /// Get category or sub category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    // Fetch limited 4 products against each subcategory
    final products = await ProductRepository.instance.getProductsForCategory(categoryId:categoryId, limit: limit );
    return products;
}



  ///
}
