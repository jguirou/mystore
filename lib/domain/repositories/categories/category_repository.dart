

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:mystore/domain/entities/category/category_model.dart';

import '../../../common/firebase/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../entities/brands/brand_category_model.dart';
import '../../entities/products/product_category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get sub categories

  /// Upload Categories to the cloud Firestore
  Future<void> uploadDummyData( List<CategoryModel> categories) async {
    try {

      // Upload all the categories along with their images
      final storage =  Get.put(FirebaseStorageService());

      // Loop through each category
      for(var category in categories){
        // Get imageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its url
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign url to Category?image attribute
        category.image = url;

        // Store category in FireStore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }

    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  Future<void> uploadProductCategory( List<ProductCategoryModel> productCategories) async {
    try {

      // Loop through each category
      for(var productCategory in productCategories){

        // Store category in FireStore
        await _db.collection('ProductCategory').doc().set(productCategory.toJson());
      }

    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadBrandCategory( List<BrandCategoryModel> brandCategories) async {
    try {

      // Loop through each category
      for(var brandCategory in brandCategories){

        // Store category in FireStore
        await _db.collection('BrandCategory').doc().set(brandCategory.toJson());
      }

    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}




