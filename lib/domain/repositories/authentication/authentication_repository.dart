
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/presentation/email_verification/ui/screen/email_verification_screen.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/on_boarding/ui/screen/on_boarding_screen.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();

  }



  /// Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null ){
      if( user.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      } else {
        Get.offAll(()=> EmailVerificationScreen(email: _auth.currentUser?.email,));
      }

    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true );
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=> const LoginScreen()): Get.offAll(()=> const OnBoardingScreen());


    }


  }



  /* -------------------- Email & password sign in------------------ */
  /// [EmailAuthentication] - Sign in
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate user

  /// [EmailVerification] - Mail verification
  Future<void> sendEmailVerification() async {
    try {
       await _auth.currentUser?.sendEmailVerification();

    } on FirebaseAuthException catch(e){
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      throw CustomFormatException();

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// [EmailAuthentication] - Forget password


  /* -------------------- Federated identity & social sign in------------------ */
  /// [GoogleAuthentication] - Google
  Future<UserCredential?> sigInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount?  userAccount = await GoogleSignIn().signIn();

      // Obtain the authentication details from request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credential =  GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once Signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);

    } on FirebaseAuthException catch(e){
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      throw CustomFormatException();

    } catch (e){
      if(kDebugMode) print("Something went wrong : $e");
      return null;
    }
  }

  /// [FacebookAuthentication] - Facebook

  /* -------------------- ./end Federated identity & social sign in------------------ */
  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());

    } on FirebaseAuthException catch(e){
      throw CustomFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw CustomFirebaseExceptions(e.code).message;

    } on FormatException catch(_){
      throw CustomFormatException(); 

    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }


/// Delete user - Remove user auth and firebase account.
}