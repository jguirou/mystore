import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../domain/repositories/authentication/authentication_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popup/full_screen_loader.dart';
import '../../../sign_up/domain/controller/signup_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// login
  void login() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "Logging you in..", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      // Save data if rememberMe is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Log in
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
