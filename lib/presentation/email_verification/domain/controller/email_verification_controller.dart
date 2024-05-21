import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/account_created/ui/screen/success_screen.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/texts.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../domain/repositories/authentication/authentication_repository.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Variables

  /// -- send Email Verification link
  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// TImer to automatically redirect on email verification.
  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: AppImages.staticSuccessIllustration,
              title: AppTexts.yourAccountCreatedTitle,
              subTile: AppTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  /// Manually check if email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
   
      Get.off(() => SuccessScreen(
        image: AppImages.staticSuccessIllustration,
        title: AppTexts.yourAccountCreatedTitle,
        subTile: AppTexts.yourAccountCreatedSubTitle,
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}
