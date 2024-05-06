
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../../entities/user/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  // Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());

    } on FirebaseAuthException catch(e){
      throw 'Something went wrong. Please try again';
      // throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw 'Something went wrong. Please try again';
      // throw CustomFirebaseException(e.code).message;

    } on FormatException catch(_){
      throw 'Something went wrong. Please try again';
      // throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user id.

  /// Function to update user data in FireStore.


  /// Update any field in specific users collection


}