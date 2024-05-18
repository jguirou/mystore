import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mystore/common/loaders/loaders.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';
import 'package:mystore/domain/repositories/categories/category_repository.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/profile/edit_profile/ui/screens/re_authenticate_user_login_form.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../presentation/sign_up/domain/controller/signup_controller.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/popup/full_screen_loader.dart';
import '../entities/category/category_model.dart';
import '../entities/user/user_model.dart';

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



  ///
}
