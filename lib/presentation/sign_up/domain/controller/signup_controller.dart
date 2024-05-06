import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';
import 'package:mystore/presentation/email_verification/ui/screen/email_verification_screen.dart';
import 'package:mystore/utils/constants/image_strings.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../domain/entities/user/user_model.dart';
import '../../../../utils/popup/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // for key for form validation

  /// -- SIGN UP
  void signup() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog("We are processing your information...", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }


      // Form validation
      if(!signupFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy policy check
      if(!privacyPolicy.value){
        Loaders.warningSnackBar(
            title: 'Accept privacy policy',
          message: 'In order to create account, you must have to read and accept the privacy policy & terms of use.'
        );
        return;
      }



      // Register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      print('after registring: ${userCredential.user!.email}');

      // Save authenticated user data in Firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Show success message
      print('after saving user in db');
      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email Screen

      //Get.to(()=> const EmailVerificationScreen());
      Future.delayed( const Duration(seconds: 3), () {Get.to(() =>  EmailVerificationScreen(email: email.text.trim()));});

    } catch (e) {
      print("feffff: ${e.toString()}");
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectivityStatus.value = result;
    if (_connectivityStatus.value == ConnectivityResult.none) {
      Loaders.warningSnackBar(title: 'No Internet connection');
    }
  }

  /// Check the internet connection status.
  /// returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  /// Dispose or close the active connectivity stream.
}
