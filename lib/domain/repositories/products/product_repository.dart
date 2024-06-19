

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';


import '../../../common/firebase/firebase_storage_service.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../entities/banner/banner_model.dart';
import '../../entities/products/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get limited featured  products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final result = await _db.collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return result.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      print('getFeaturedProducts $e');
      throw 'Something went wrong. Please try again.';
    }
  }


  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {


      final result =  await _db.collection('Products').where('isFeatured', isEqualTo: true).get();
      return result.docs.map((document) => ProductModel.fromSnapshot(document)).toList();


    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw CustomFormatException();
    } catch (e) {
      print('dfdfdc $e');
      throw 'Something went wrong. Please try again ggggg';
    }
  }


  /// Upload banners to the cloud firestore

  Future<void> uploadProducts( List<ProductModel> products) async {
    try {

      // Upload all the categories along with their images
      final storage =  Get.put(FirebaseStorageService());

      // Loop through each category
      for(var product in products){
        // Get imageData link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get its url
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign url to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if(product.images != null && product.images!.isNotEmpty){
          List<String> imagesUrl = [];
          for(var image in product.images!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // upload image and get its url
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign url to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload variation images
        if(product.productType == ProductType.variable.toString()) {
          for ( var variation in product.productVariations!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // upload image and get its url
            final url = await storage.uploadImageData('Products/Image', assetImage, variation.image);

            // Assign url to product.thumbnail attribute
            variation.image = url;
          }

        }


        // Store product in FireStore
        await _db.collection('Products').doc(product.id).set(product.toJson());
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


  /// Get products based on on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;

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




