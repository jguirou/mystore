

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mystore/domain/entities/category/category_model.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/presentation/email_verification/ui/screen/email_verification_screen.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/on_boarding/ui/screen/on_boarding_screen.dart';

import '../../../common/firebase/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

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
}




