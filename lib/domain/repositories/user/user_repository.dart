
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
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

      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      //throw 'Something went wrong. Please try again';
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      //throw 'Something went wrong. Please try again';
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user id.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapShot  = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapShot.exists){
        return UserModel.fromSnapshot(documentSnapShot);
      } else {
        return UserModel.empty();
      }

    } on FirebaseAuthException catch(e){

       throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      //throw 'Something went wrong. Please try again';
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      //throw 'Something went wrong. Please try again';
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Function to update user data in FireStore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(updatedUser.toJson());


    } on FirebaseAuthException catch(e){

      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      //throw 'Something went wrong. Please try again';
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      //throw 'Something went wrong. Please try again';
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);


    } on FirebaseAuthException catch(e){

      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      //throw 'Something went wrong. Please try again';
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      //throw 'Something went wrong. Please try again';
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();


    } on FirebaseAuthException catch(e){

      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      //throw 'Something went wrong. Please try again';
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      //throw 'Something went wrong. Please try again';
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
}