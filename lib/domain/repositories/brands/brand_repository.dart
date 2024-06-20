

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:mystore/domain/entities/brands/brand_model.dart';
import 'package:mystore/domain/entities/category/category_model.dart';

import '../../../common/firebase/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();

      final list = snapshot.docs.map((document) => BrandModel.fromSnapshot(document)).toList();
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


  /// Upload brands to the cloud Firestore
  Future<void> uploadDummyData( List<BrandModel> brands) async {
    try {

      // Upload all the categories along with their images
      final storage =  Get.put(FirebaseStorageService());

      // Loop through each category
      for(var brand in brands){
        // Get imageData link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // upload image and get its url
        final url = await storage.uploadImageData('Brands', file, brand.name);

        // Assign url to Brand?image attribute
        brand.image = url;

        // Store category in FireStore
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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




