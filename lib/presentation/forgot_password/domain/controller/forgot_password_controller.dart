import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popup/full_screen_loader.dart';
import '../../../reset_password/ui/screen/reset_password_screen.dart';
import '../../../sign_up/domain/controller/signup_controller.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey =  GlobalKey<FormState>();


  /// Send
  void sendPasswordResetEmail() async {
    try{
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "Processing your request..", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());


      // Show success message

      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link Sent to Reset your Password'.tr);

      // Move to verify Email Screen

      //Get.to(()=> const EmailVerificationScreen());
      Get.to(() =>  ResetPasswordScreen(email: email.text.trim()));

    }catch (e) {
      // Show success message
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void reSendPasswordResetEmail(String email) async {
    try{
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "Processing your request..", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);


      // Show success message

      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link Sent to Reset your Password'.tr);


    }catch (e) {
      // Show success message
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}