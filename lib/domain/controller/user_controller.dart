import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/loaders/loaders.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/profile/edit_profile/ui/screens/re_authenticate_user_login_form.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../presentation/sign_up/domain/controller/signup_controller.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/popup/full_screen_loader.dart';
import '../entities/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading =  false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {

    super.onInit();
    fetchUserRecord();

  }



  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value =  true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);

    }catch (e){
      user(UserModel.empty());
    } finally{
      profileLoading.value =  false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {

    try{
      if(userCredential != null){
        // Convert name to first and last name
        final nameParts  = UserModel.nameParts(userCredential.user?.displayName ?? '');
        final userName = UserModel.generateUserName(userCredential.user?.displayName ?? '');

        // Map data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ?  nameParts.sublist(1).join(' '): '',
            username: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');


        // Save user data
        await userRepository.saveUserRecord(user);

      }

    } catch (e){
      Loaders.warningSnackBar(
          title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.'
      );
    }
  }

  /// Delete account warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
            child: Text('Delete'),
          )
      ),
      cancel: OutlinedButton(
          onPressed: ()=> Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'))


    );
  }

  /// Delete user account
  Future<void> deleteUserAccount() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "processing..", AppImages.productImage1);

      // First reAuthenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      // reverify auth email
      print("provider check");
      if(provider.isNotEmpty){
        if(provider == 'google.com'){
          print("provider google");
          await auth.sigInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());


        }else if(provider == 'password'){
          FullScreenLoader.stopLoading();
          Get.to(()=> const ReAuthenticateUserLoginForm());
        }
      }



    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "Processing..", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      // Save data if rememberMe is selected



      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // remove loader
      FullScreenLoader.stopLoading();
      Get.offAll(()=> const LoginScreen());
    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}