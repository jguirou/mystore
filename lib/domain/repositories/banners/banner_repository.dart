

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';


import '../../../common/firebase/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../entities/banner/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get all order related to the current user
  Future<List<BannerModel>> fetchBanners() async {
    try {


      final result =  await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((document) => BannerModel.fromSnapshot(document)).toList();


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


  /// Upload banners to the cloud firestore

  Future<void> uploadBanners( List<BannerModel> banners) async {
    try {

      // Upload all the categories along with their images
      final storage =  Get.put(FirebaseStorageService());

      // Loop through each category
      for(var banner in banners){
        // Get imageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // upload image and get its url
        final url = await storage.uploadImageData('Banners', file, banner.imageUrl);

        // Assign url to Category?image attribute
        banner.imageUrl = url;

        // Store category in FireStore
        await _db.collection('Banners').doc(banner.id).set(banner.toJson());
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




